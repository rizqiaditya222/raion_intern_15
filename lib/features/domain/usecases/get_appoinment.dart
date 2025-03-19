import 'package:raion_intern_15/features/domain/entities/appointment.dart';
import 'package:raion_intern_15/features/domain/repositorires/appointment_repository.dart';

class GetAppoinment {
  final AppointmentRepository repository;

  GetAppoinment(this.repository);

  Future<AppointmentEntity> call(String id) async {
    return await repository.getAppoinment(id);
  }
}