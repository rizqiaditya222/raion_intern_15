// auth_repository.dart
import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);

  // Registrasi untuk customer
  Future<UserEntity> registerCustomer({
    required String email,
    required String password,
    required String fullName,
    String bio,
  });

  // Registrasi untuk dokter
  Future<UserEntity> registerDoctor({
    required String email,
    required String password,
    required String fullName,
    required String bio,
    required String licenseNumber,
    required String specialization,
  });
}
