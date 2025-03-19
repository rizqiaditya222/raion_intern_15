import '../entities/doctor.dart';
import '../repositorires/doctor_repository.dart';

class GetDoctor {
  final DoctorRepository repository;

  GetDoctor(this.repository);

  Future<Doctor> call(String id) async {
    return await repository.getDoctor(id);
  }
}
