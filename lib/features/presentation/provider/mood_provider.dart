import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../data/models/mood_model.dart';
import '../../data/repositories/mood_repository.dart';

class MoodProvider extends ChangeNotifier {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final MoodRepository _moodRepository = MoodRepository();
  List<MoodModel> _moodHistory = [];

  List<MoodModel> get moodHistory => _moodHistory;

  Map<DateTime, String> _moodData = {};

  Map<DateTime, String> get moodData => _moodData;

  Future<void> saveMood(String userId, MoodModel mood) async {
    await _moodRepository.saveMood(userId, mood);
    _moodHistory.insert(0, mood);
    notifyListeners();
  }

  Future<void> fetchMoodHistory(String userId) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('users')
          .doc(userId)
          .collection('moods')
          .orderBy('date', descending: true)
          .get();

      _moodHistory = snapshot.docs
          .map((doc) => MoodModel.fromJson(doc.data() as Map<String, dynamic>))
          .toList();

      _moodData.clear();
      for (var mood in _moodHistory) {
        DateTime onlyDate = DateTime(
          mood.date.year,
          mood.date.month,
          mood.date.day,
        );
        _moodData[onlyDate] = mood.mood;
      }

      notifyListeners();
    } catch (e) {
      throw Exception("Gagal mengambil data mood: $e");
    }
  }
}
