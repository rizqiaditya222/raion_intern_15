import 'package:raion_intern_15/features/domain/entities/user.dart';
import 'doctor.dart';

class AppointmentEntity {
  final String id;
  final String userID;
  final String doctorID;
  final DateTime dateTime;
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

  AppointmentEntity copyWith({
    String? id,
    String? userID,
    String? doctorID,
    DateTime? dateTime,
    String? status,
    String? fullName,
    String? gender,
    String? consultation,
    double? height,
    double? weight,
    String? address,
  }) {
    return AppointmentEntity(
      id: id ?? this.id,
      userID: userID ?? this.userID,
      doctorID: doctorID ?? this.doctorID,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      fullName: fullName ?? this.fullName,
      gender: gender ?? this.gender,
      consultation: consultation ?? this.consultation,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      address: address ?? this.address,
    );
  }
}
