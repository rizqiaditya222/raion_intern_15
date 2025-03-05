
import '../../domain/entities/user.dart';
import '../../domain/repositorires/auth_repository.dart';
import '../datasources/firebase_auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuthService firebaseAuthService;

  AuthRepositoryImpl(this.firebaseAuthService);

  @override
  Future<UserEntity> login(String email, String password) async {
    final user = await firebaseAuthService.login(email, password);
    return UserEntity(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      bio: user.bio,
      role: user.role,
      licenseNumber: user.licenseNumber,
      specialization: user.specialization,
    );
  }

  @override
  Future<UserEntity> registerCustomer({
    required String email,
    required String password,
    required String fullName,
    String? bio,
  }) async {
    final user = await firebaseAuthService.registerCustomer(
      email: email,
      password: password,
      fullName: fullName,
    );

    return UserEntity(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      bio: user.bio,
      role: UserRole.customer, // Pastikan role ditentukan
    );
  }

  @override
  Future<UserEntity> registerDoctor({
    required String email,
    required String password,
    required String fullName,
    required String bio,
    required String licenseNumber,
    required String specialization,
  }) async {
    final user = await firebaseAuthService.registerDoctor(
      email: email,
      password: password,
      fullName: fullName,
      bio: bio,
      licenseNumber: licenseNumber,
      specialization: specialization,
    );

    return UserEntity(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      bio: user.bio,
      role: UserRole.doctor, // Tentukan role sebagai dokter
      licenseNumber: licenseNumber,
      specialization: specialization,
    );
  }
}
