
import '../../domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String id,
    required String name,
    required String bio,
    required String specialization,
    required String hospital,
    required double rating,
    required int ratingAmount,
    required double distance,
    required List<Approach> pendekatan,
  }) : super(
    id: id,
    name: name,
    bio: bio,
    hospital: hospital,
    ratingAmount: ratingAmount,
    distance: distance,
    rating: rating,
    specialization: specialization,
    pendekatan: pendekatan,
  );

  factory DoctorModel.fromJson(Map<String, dynamic> json, String docId) {
    return DoctorModel(
      id: docId,
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      hospital: json['hospital'] ?? '',
      ratingAmount: (json['ratingAmount'] as num?)?.toInt() ?? 0,
      distance: (json['distance'] as num?)?.toDouble() ?? 0.0,
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      specialization: json['specialization'] ?? '',
      pendekatan: (json['pendekatan'] as List<dynamic>?)
          ?.map((item) => Approach.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}
