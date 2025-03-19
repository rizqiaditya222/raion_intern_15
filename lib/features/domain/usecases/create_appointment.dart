import '../../../core/usecases/usecases.dart';
import '../entities/appointment.dart';
import '../repositorires/appointment_repository.dart';

class CreateAppointment implements UseCase<AppointmentEntity, CreateAppointmentParams> {
  final AppointmentRepository repository;

  CreateAppointment(this.repository);

  @override
  Future<AppointmentEntity> call(CreateAppointmentParams params) async {
    return await repository.createAppointment(
      userID: params.userID,
      doctorID: params.doctorID,
      dateTime: params.dateTime,
      status: params.status,
      fullName: params.fullName,
      gender: params.gender,
      consultation: params.consultation,
      height: params.height,
      weight: params.weight,
      address: params.address,
    );
  }
}

class CreateAppointmentParams {
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

  CreateAppointmentParams({
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
}
