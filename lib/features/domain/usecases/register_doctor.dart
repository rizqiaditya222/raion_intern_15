import '../../../core/usecases/usecases.dart';
import '../entities/user.dart';
import '../repositorires/auth_repository.dart';

class RegisterDoctor implements UseCase<UserEntity, RegisterDoctorParams> {
  final AuthRepository repository;

  RegisterDoctor(this.repository);

  @override
  Future<UserEntity> call(RegisterDoctorParams params) async => await repository.registerDoctor(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
      bio: params.bio,
      licenseNumber: params.licenseNumber,
      specialization: params.specialization,
    );
}

class RegisterDoctorParams {
  final String email;
  final String password;
  final String fullName;
  final String bio;
  final String licenseNumber;
  final String specialization;

  RegisterDoctorParams({
    required this.email,
    required this.password,
    required this.fullName,
    required this.bio,
    required this.licenseNumber,
    required this.specialization,
  });
}