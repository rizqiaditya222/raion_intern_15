import '../../domain/entities/user.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.id,
    required super.email,
    required super.fullName,
    required super.bio,
    required super.role,
    super.licenseNumber,
    super.specialization,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['uid'],
      email: json['email'],
      fullName: json['fullName'],
      bio: json['bio'],
      role: UserRole.values.firstWhere(
            (e) => e.toString().split('.').last == json['role'],
        orElse: () => UserRole.customer,
      ),
      licenseNumber: json['licenseNumber'],
      specialization: json['specialization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': id,
      'email': email,
      'fullName': fullName,
      'bio': bio,
      'role': role.toString().split('.').last,
      'licenseNumber': licenseNumber,
      'specialization': specialization,
    };
  }
}
