import 'package:flutter/foundation.dart';
import 'package:raion_intern_15/features/domain/repositorires/appointment_repository.dart';
import 'package:raion_intern_15/features/domain/usecases/create_appointment.dart';
import 'package:raion_intern_15/features/domain/usecases/get_appoinment.dart';

import '../../domain/entities/appointment.dart';

class CreateAppoinmentProvider with ChangeNotifier {
  final AppointmentRepository repository;
  final CreateAppointment createAppointmentUseCase;
  final GetAppoinment getAppoinment;

  CreateAppoinmentProvider({
    required this.repository,
    required this.getAppoinment,
    required this.createAppointmentUseCase,
  });

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<Map<String, dynamic>> _appointmentsWithDoctors = [];
  List<Map<String, dynamic>> get appointmentsWithDoctors => _appointmentsWithDoctors;

  List<AppointmentEntity> _appoinments = [];
  List<AppointmentEntity> get appoinments => _appoinments;
  AppointmentEntity? _currentAppointment;
  AppointmentEntity? get currentAppointment => _currentAppointment;

  Future<void> fetchAllAppoinment() async {
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

  Future<void> fetchAppointmentsWithDoctors(String currentUserID) async {
    try {
      final appointments = await repository.getAllAppoinment();
      debugPrint("Fetch appointments berhasil, jumlah: ${appointments.length}");

      List<Map<String, dynamic>> tempList = [];

      for (var appointment in appointments) {
        if (appointment.userID == currentUserID) {  // Filter appointment berdasarkan user yang sedang login
          final doctor = await repository.getDoctorById(appointment.doctorID);
          tempList.add({
            'appointment': appointment,
            'doctor': doctor,
          });
        }
      }

      _appointmentsWithDoctors = tempList;
      notifyListeners();
    } catch (e) {
      print("Error fetching appointments: $e");
    }
  }

  Future<void> deleteAppointmentById(String appointmentId) async {
    try {
      await repository.deleteAppointment(appointmentId);
      debugPrint("Appointment dengan ID: $appointmentId telah dihapus");
      notifyListeners();
    } catch (e) {
      debugPrint("Gagal menghapus appointment: $e");
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
