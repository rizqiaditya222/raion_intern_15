// auth_repository.dart
import '../entities/user.dart';

abstract class AuthRepository {
  Future<UserEntity> login(String email, String password);

  Future<UserEntity> registerCustomer({
    required String email,
    required String password,
    required String fullName,
    String bio,
  });

  Future<UserEntity> registerDoctor({
    required String email,
    required String password,
    required String fullName,
    required String bio,
    required String licenseNumber,
    required String specialization,
  });
}
