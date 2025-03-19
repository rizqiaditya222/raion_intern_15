
import 'package:flutter/foundation.dart';
import 'package:raion_intern_15/features/domain/repositorires/appointment_repository.dart';
import 'package:raion_intern_15/features/domain/usecases/create_appointment.dart';
import 'package:raion_intern_15/features/domain/usecases/get_appoinment.dart';

import '../../domain/entities/appointment.dart';

class CreateAppoinmentProvider with ChangeNotifier {
  final CreateAppointment createAppointmentUseCase;
  final GetAppoinment getAppoinment;

  CreateAppoinmentProvider({required this.getAppoinment, required this.createAppointmentUseCase});

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<AppointmentEntity> _appoinments = [];
  List<AppointmentEntity> get appoinments => _appoinments;
  AppointmentEntity? _currentAppointment;
  AppointmentEntity? get currentAppointment => _currentAppointment;

  Future<void> fetchAllDoctors(AppointmentRepository repository) async {
    _setLoading(true);
    _clearError();
    try {
      final result = await repository.getAllAppoinment();
      _appoinments = result;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> fetchAppoinment(String id) async {
    _setLoading(true);
    _clearError();
    try {
      final appoinment = await getAppoinment(id);
      _currentAppointment = appoinment;
      notifyListeners();
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> createAppointment({
    required String userID,
    required String doctorID,
    required DateTime dateTime,
    required String status,
    required String fullName,
    required String gender,
    required String consultation,
    required double height,
    required double weight,
    required String address,
  }) async {
    try {
      final newAppointment = await createAppointmentUseCase(
        CreateAppointmentParams(
          id: "",
          userID: userID,
          doctorID: doctorID,
          dateTime: dateTime,
          status: status,
          fullName: fullName,
          gender: gender,
          consultation: consultation,
          height: height,
          weight: weight,
          address: address,
        ),
      );

      _currentAppointment = newAppointment;
      notifyListeners();
    } catch (e) {
      print("Error creating appointment: $e");
      throw Exception("Gagal membuat appointment");
    }
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
