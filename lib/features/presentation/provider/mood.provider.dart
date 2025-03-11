import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class MoodProvider with ChangeNotifier {
  String _selectedMoodImage = happy;

  String get selectedMoodImage => _selectedMoodImage;

  void updateMood(String newMoodImage) {
    _selectedMoodImage = newMoodImage;
    notifyListeners();
  }
}