import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/doctor.dart';
import '../../domain/repositorires/doctor_repository.dart';
import '../models/doctor_model.dart';

class DoctorRepositoryImpl implements DoctorRepository {
  final FirebaseFirestore firestore;

  DoctorRepositoryImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<Doctor> getDoctor(String id) async {
    try {
      final docSnap = await firestore.collection('doctor').doc(id).get();
      if (!docSnap.exists || docSnap.data() == null) {
        throw Exception('Dokter tidak ditemukan');
      }
      return DoctorModel.fromJson(docSnap.data()!, docSnap.id);
    } catch (e) {
      throw Exception('Error saat mengambil data dokter: $e');
    }
  }

  @override
  Future<List<Doctor>> getAllDoctors() async {
    try {
      final querySnapshot = await firestore.collection('doctor').get();
      return querySnapshot.docs.map((doc) {
        return DoctorModel.fromJson(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Error saat mengambil daftar dokter: $e');
    }
  }
}
