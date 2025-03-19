import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raion_intern_15/features/data/models/appointment_model.dart';
import 'package:raion_intern_15/features/domain/entities/appointment.dart';

import '../../domain/repositorires/appointment_repository.dart';

class AppointmentRepositoryImpl implements AppointmentRepository {
  final FirebaseFirestore firestore;

  AppointmentRepositoryImpl({required this.firestore});

  @override
  Future<AppointmentEntity> createAppointment({
    required String userID,
    required String doctorID,
    required DateTime dateTime,
    required String status,
    required String fullName,
    required String gender,
    required String consultation,
    required double height,
    required double weight,
    required String address,
  }) async {
    try {
      DocumentReference docRef = firestore.collection('appointments').doc();

      final appointmentData = {
        'id': docRef.id,
        'userID': userID,
        'doctorID': doctorID,
        'dateTime': dateTime.toIso8601String(),
        'status': status,
        'fullName': fullName,
        'gender': gender,
        'consultation': consultation,
        'height': height,
        'weight': weight,
        'address': address,
      };

      await docRef.set(appointmentData);

      return AppointmentEntity(
        id: docRef.id,
        userID: userID,
        doctorID: doctorID,
        dateTime: dateTime,
        status: status,
        fullName: fullName,
        gender: gender,
        consultation: consultation,
        height: height,
        weight: weight,
        address: address,
      );
    } catch (e) {
      print("Error adding appointment: $e");
      throw Exception("Gagal menambahkan appointment");
    }
  }

  @override
  Future<AppointmentEntity> getAppoinment(String id) async {
    try {
      final docSnap = await firestore.collection('doctor').doc(id).get();
      if (!docSnap.exists || docSnap.data() == null) {
        throw Exception('Dokter tidak ditemukan');
      }
      return AppointmentModel.fromJson(docSnap.data()!, docSnap.id);
    } catch (e) {
      throw Exception('Error saat amenability data dokter: $e');
    }
  }

  @override
  Future<List<AppointmentEntity>> getAllAppoinment() async {
    try {
      final querySnapshot = await firestore.collection('doctor').get();
      return querySnapshot.docs.map((doc) {
        return AppointmentModel.fromJson(doc.data(), doc.id);
      }).toList();
    } catch (e) {
      throw Exception('Error saat mengambil daftar dokter: $e');
    }
  }
}
