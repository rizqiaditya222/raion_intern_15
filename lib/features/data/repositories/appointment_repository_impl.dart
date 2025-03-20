  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
  import 'package:raion_intern_15/features/data/models/appointment_model.dart';
  import 'package:raion_intern_15/features/domain/entities/appointment.dart';

  import '../../domain/repositorires/appointment_repository.dart';
  import '../models/doctor_model.dart';

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
        final docSnap = await firestore.collection('appointments').doc(id).get();
        if (!docSnap.exists || docSnap.data() == null) {
          throw Exception('Appointment tidak ditemukan');
        }
        return AppointmentModel.fromJson(docSnap.data()!, docSnap.id);
      } catch (e) {
        throw Exception('Error saat mengambil data appointment: $e');
      }
    }

    @override
    Future<List<AppointmentEntity>> getAllAppoinment() async {
      try {
        final querySnapshot = await firestore.collection('appointments').get();
        return querySnapshot.docs.map((doc) {
          debugPrint("Appointment ditemukan: ${doc.id}, Data: ${doc.data()}");
          return AppointmentModel.fromJson(doc.data(), doc.id);
        }).toList();
      } catch (e) {
        throw Exception('Error saat mengambil daftar appointment: $e');
      }
    }

    Future<DoctorModel?> getDoctorById(String? doctorId) async {
      try {
        if (doctorId == null || doctorId.isEmpty) {
          debugPrint("Error: doctorId kosong atau null!");
          return null;
        }

        debugPrint("Mencari dokter dengan ID: $doctorId");
        final docSnap = await firestore.collection('doctor').doc(doctorId).get();

        if (docSnap.exists && docSnap.data() != null) {
          debugPrint("Dokter ditemukan: ${docSnap.data()}");
          return DoctorModel.fromJson(docSnap.data()!, docSnap.id);
        } else {
          debugPrint("Dokter dengan ID $doctorId tidak ditemukan.");
        }

        return null;
      } catch (e) {
        print("Error fetching doctor: $e");
        return null;
      }
    }


  }
