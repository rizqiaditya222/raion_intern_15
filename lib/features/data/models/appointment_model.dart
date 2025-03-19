import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/appointment.dart';

class AppointmentModel extends AppointmentEntity {
  AppointmentModel({
    required String id,
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
  }) : super(
    id: id,
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

  factory AppointmentModel.fromJson(Map<String, dynamic> json, String docId) {
    return AppointmentModel(
      id: docId,
      userID: json['userID'] ?? '',
      doctorID: json['doctorID'] ?? '',
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      status: json['status'] ?? '',
      fullName: json['fullName'] ?? '',
      gender: json['gender'] ?? '',
      consultation: json['consultation'] ?? '',
      height: (json['height'] as num?)?.toDouble() ?? 0.0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      address: json['address'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userID': userID,
      'doctorID': doctorID,
      'dateTime': dateTime,
      'status': status,
      'fullName': fullName,
      'gender': gender,
      'consultation': consultation,
      'height': height,
      'weight': weight,
      'address': address,
    };
  }
}
