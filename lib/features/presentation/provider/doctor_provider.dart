import 'package:flutter/material.dart';
import '../../domain/entities/doctor.dart';
import '../../domain/repositorires/doctor_repository.dart';
import '../../domain/usecases/get_doctor.dart';
class DoctorProvider with ChangeNotifier {
  final GetDoctor getDoctor;
  DoctorProvider({required this.getDoctor});

  Doctor? _doctor;
  List<Doctor> _doctors = [];
  bool _isLoading = false;
  String? _errorMessage;

  Doctor? get doctor => _doctor;
  List<Doctor> get doctors => _doctors;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchDoctorProfile(String doctorId) async {
    _setLoading(true);
    _clearError();
    try {
      final doctor = await getDoctor(doctorId);
      _doctor = doctor;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchAllDoctors(DoctorRepository repository) async {
    _setLoading(true);
    _clearError();
    try {
      final result = await repository.getAllDoctors();
      _doctors = result;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void setSelectedDoctor(Doctor doctor) {
    _doctor = doctor;
    notifyListeners();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    notifyListeners();
  }

  void _clearError() {
    _errorMessage = null;
  }
}

