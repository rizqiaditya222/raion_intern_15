import '../entities/doctor.dart';

abstract class DoctorRepository {
  Future<Doctor> getDoctor(String id);
  Future<List<Doctor>> getAllDoctors();
}
