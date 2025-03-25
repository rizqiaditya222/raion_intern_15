import 'package:raion_intern_15/features/domain/entities/appointment.dart';

import '../../data/models/doctor_model.dart';

abstract class AppointmentRepository {
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
  });

  Future<AppointmentEntity> getAppoinment(String id);

  Future<List<AppointmentEntity>> getAllAppoinment();

  Future<DoctorModel?> getDoctorById(String doctorId);

  Future<void> deleteAppointment(String appointmentId);
}
