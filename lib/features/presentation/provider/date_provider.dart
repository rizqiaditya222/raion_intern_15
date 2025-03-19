import 'package:flutter/cupertino.dart';

class DateProvider with ChangeNotifier {
  DateTime? _selectedDate;
  String? _selectedTime;

  DateTime? get selectedDate => _selectedDate;
  String? get selectedTime => _selectedTime;

  void updateSelectedDate(DateTime date) {
    _selectedDate = date;
    notifyListeners();
  }

  void updateSelectedTime(String time) {
    _selectedTime = time;
    notifyListeners();
  }
}