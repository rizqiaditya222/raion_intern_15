import 'package:cloud_firestore/cloud_firestore.dart';

class AppointmentEntity {
  final String id;
  final String userID;
  final String doctorID;
  final DateTime dateTime; // Gunakan DateTime
  final String status;
  final String fullName;
  final String gender;
  final String consultation;
  final double height;
  final double weight;
  final String address;

  AppointmentEntity({
    required this.id,
    required this.userID,
    required this.doctorID,
    required this.dateTime,
    required this.status,
    required this.fullName,
    required this.gender,
    required this.consultation,
    required this.height,
    required this.weight,
    required this.address,
  });

  factory AppointmentEntity.fromJson(Map<String, dynamic> json, String docId) {
    return AppointmentEntity(
      id: docId,
      userID: json['userID'] ?? '',
      doctorID: json['doctorID'] ?? '',
      dateTime: json['dateTime'] is Timestamp
          ? (json['dateTime'] as Timestamp).toDate()
          : (json['dateTime'] is String ? DateTime.tryParse(json['dateTime']) ?? DateTime(2000) : DateTime(2000)),

      status: json['status'] ?? '',
      fullName: json['fullName'] ?? '',
      gender: json['gender'] ?? '',
      consultation: json['consultation'] ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] ?? '',
    );
  }

}
