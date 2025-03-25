import '../../domain/entities/mood.dart';

class MoodModel extends MoodEntity {
  MoodModel({
    required super.date,
    required super.mood,
    required super.note,
    required super.sleep,
    required super.stress,
    required super.kesibukan,
  });

  factory MoodModel.fromJson(Map<String, dynamic> json) {
    return MoodModel(
      date: DateTime.parse(json['date']),
      mood: json['mood'],
      note: json['note'],
      sleep: json['sleep'] ?? 0,
      stress: json['stress'] ?? 0,
      kesibukan: json['kesibukan'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date.toIso8601String(),
      'mood': mood,
      'note': note,
      'sleep': sleep,
      'stress': stress,
      'kesibukan': kesibukan,
    };
  }
}
