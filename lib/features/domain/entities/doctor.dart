class Doctor {
  final String id;
  final String name;
  final String bio;
  final String specialization;
  final String hospital;
  final double rating;
  final int ratingAmount;
  final double distance;
  final List<Approach> pendekatan;

  Doctor({
    required this.id,
    required this.name,
    required this.bio,
    required this.specialization,
    required this.hospital,
    required this.rating,
    required this.ratingAmount,
    required this.distance,
    required this.pendekatan,
  });

  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['doctor_id'] ?? '',
      name: map['name'] ?? '',
      bio: map['bio'] ?? '',
      specialization: map['specialization'] ?? '',
      hospital: map['hospital'] ?? '',
      rating: (map['rating'] ?? 0.0).toDouble(),
      ratingAmount: (map['ratingAmount'] ?? 0),
      distance: (map['distance'] ?? 0.0).toDouble(),
      pendekatan: (map['pendekatan'] as List<dynamic>?)
          ?.map((item) => Approach.fromJson(item as Map<String, dynamic>))
          .toList() ??
          [],
    );
  }
}
class Approach {
  final String title;
  final String description;

  Approach({
    required this.title,
    required this.description,
  });

  factory Approach.fromJson(Map<String, dynamic> json) {
    return Approach(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
