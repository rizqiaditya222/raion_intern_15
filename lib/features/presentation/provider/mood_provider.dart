import 'package:flutter/material.dart';
import '../../data/models/mood_model.dart';
import '../../data/repositories/mood_repository.dart';

class MoodProvider extends ChangeNotifier {
  final MoodRepository _moodRepository = MoodRepository();
  List<MoodModel> _moodHistory = [];

  List<MoodModel> get moodHistory => _moodHistory;

  Future<void> saveMood(String userId, MoodModel mood) async {
    await _moodRepository.saveMood(userId, mood);
    _moodHistory.insert(0, mood);
    notifyListeners();
  }

  Future<void> fetchMoodHistory(String userId) async {
    _moodHistory = await _moodRepository.getMoodHistory(userId);
    notifyListeners();
  }
}
