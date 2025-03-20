import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class MoodDataProvider with ChangeNotifier {
  String _selectedMoodImage = happy;
  DateTime? _dateTime;
  String _notes = "";
  int _sleep = 0;
  int _stress = 0;
  int _kesibukan = 0;

  // Getter
  String get selectedMoodImage => _selectedMoodImage;
  DateTime? get dateTime => _dateTime;
  String get notes => _notes;
  int get sleep => _sleep;
  int get stress => _stress;
  int get kesibukan => _kesibukan;

  // Setter dengan notifyListeners()
  void updateMood(String newMoodImage) {
    _selectedMoodImage = newMoodImage;
    notifyListeners();
  }

  void updateDateTime(DateTime date) {
    _dateTime = date;
    notifyListeners();
  }

  void updateNotes(String newNotes) {
    _notes = newNotes;
    notifyListeners();
  }

  void updateSleep(int sleepHours) {
    _sleep = sleepHours;
    notifyListeners();
  }

  void updateStress(int stressLevel) {
    _stress = stressLevel;
    notifyListeners();
  }

  void updateKesibukan(int kesibukanLevel) {
    _kesibukan = kesibukanLevel;
    notifyListeners();
  }

  // Reset semua data
  void resetMoodData() {
    _selectedMoodImage = happy;
    _dateTime = null;
    _notes = "";
    _sleep = 0;
    _stress = 0;
    _kesibukan = 0;
    notifyListeners();
  }
}
