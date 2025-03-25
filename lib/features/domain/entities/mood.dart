class MoodEntity {
  final DateTime date;
  final String mood;
  final String note;
  final int sleep;
  final int stress;
  final int kesibukan;

  MoodEntity({
    required this.sleep,
    required this.stress,
    required this.kesibukan,
    required this.date,
    required this.mood,
    required this.note,
  });
}
