// user.dart
enum UserRole { doctor, customer }

class UserEntity {
  final String id;
  final String email;
  final String fullName;
  final String bio;
  final UserRole role;
  final String? licenseNumber;
  final String? specialization;

  UserEntity({
    required this.id,
    required this.email,
    required this.fullName,
    required this.bio,
    required this.role,
    this.licenseNumber,
    this.specialization,
  });
}
