import 'package:flutter/material.dart';

class StepProvider extends ChangeNotifier {
  int _currentStep = 0;
  DateTime _selectedDate = DateTime.now();
  String _appbarText = "Informasi Pasien";
  String _buttonText = "Konsultasi";

  int get currentStep => _currentStep;
  DateTime get selectedDate => _selectedDate;
  String get appbarText => _appbarText;
  String get buttonText => _buttonText;

  void nextStep() {
    if (_currentStep < 2) {
      _currentStep++;
      updateAppbarText();
      notifyListeners();
    }
  }

  void previousStep() {
    if (_currentStep > 0) {
      _currentStep--;
      updateAppbarText();
      notifyListeners();
    }
  }

  void setSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updateAppbarText() {
    switch (_currentStep) {
      case 0:
        _appbarText = "Informasi Pasien";
        _buttonText = "Konsultasi";
        break;
      case 1:
        _appbarText = "Pilih Tanggal";
        _buttonText = "Pembayaran";
        break;
      case 2:
        _appbarText = "Pembayaran";
        _buttonText = "Bayar";
        break;
      default:
        _appbarText = "Stepper";
    }
  }
}
