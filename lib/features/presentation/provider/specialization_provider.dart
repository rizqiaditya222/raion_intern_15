import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class SpecializationProvider with ChangeNotifier {
  String _selectedSpecialization = "Anxiety";

  String get selectedSpecialization => _selectedSpecialization;

  void updateSpecialization(String newSpecialization) {
    _selectedSpecialization = newSpecialization;
    notifyListeners();
  }
}
