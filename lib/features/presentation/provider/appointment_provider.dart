import 'package:flutter/material.dart';

class AppointmentProvider extends ChangeNotifier {
  String _userID = '';
  String _doctorID = '';
  DateTime _dateTime = DateTime.now();
  String _status = '';
  String _fullName = '';
  String _gender = '';
  String _consultation = '';
  double _height = 0.0;
  double _weight = 0.0;
  String _address = '';

  String get userID => _userID;
  String get doctorID => _doctorID;
  DateTime get dateTime => _dateTime;
  String get status => _status;
  String get fullName => _fullName;
  String get gender => _gender;
  String get consultation => _consultation;
  double get height => _height;
  double get weight => _weight;
  String get address => _address;

  void updateUserID(String userID) {
    _userID = userID;
    notifyListeners();
  }

  void updateDoctorID(String doctorID) {
    _doctorID = doctorID;
    notifyListeners();
  }

  void updateDateTime(DateTime date, String time) {
    List<String> timeParts = time.split(":");
    int hour = int.parse(timeParts[0]);
    int minute = int.parse(timeParts[1]);

    _dateTime = DateTime(date.year, date.month, date.day, hour, minute);

    print(_dateTime);
    notifyListeners();
  }

  void updateStatus(String status) {
    _status = status;
    notifyListeners();
  }

  void updateFullName(String fullName) {
    _fullName = fullName;
    notifyListeners();
  }

  void updateGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void updateConsultation(String consultation) {
    _consultation = consultation;
    notifyListeners();
  }

  void updateHeight(double height) {
    _height = height;
    notifyListeners();
  }

  void updateWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void updateAddress(String address) {
    _address = address;
    notifyListeners();
  }
}
