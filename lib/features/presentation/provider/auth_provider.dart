import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_doctor.dart';
import '../../domain/usecases/register_user.dart';
import '../screens/homescreen/doctor_page.dart';
import '../screens/homescreen/patient_page.dart';


class AuthProvider with ChangeNotifier {
  final LoginUser loginUser;
  final RegisterCustomer registerCustomer;
  final RegisterDoctor registerDoctor;

  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthProvider({
    required this.loginUser,
    required this.registerCustomer,
    required this.registerDoctor,
  });

  Future<void> login(String email, String password, BuildContext context) async {
    _setLoading(true);
    _clearError();
    try {
      // Memanggil use case login dan mendapatkan objek UserEntity yang memiliki property role
      UserEntity user = await loginUser(LoginParams(email: email, password: password));

      // Mengarahkan pengguna ke halaman yang sesuai berdasarkan role
      if (user.role == UserRole.doctor) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const DoctorPage()),
        );
      } else if (user.role == UserRole.customer) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const PatientPage()),
        );
      }
    } catch (e) {
      _setError(e.toString());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      _setLoading(false);
    }
  }

  Future<String> getUserRole(String email) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users') // Sesuaikan dengan koleksi Firestore
          .doc(email) // Gunakan email sebagai ID dokumen
          .get();

      if (userDoc.exists) {
        return userDoc['role']; // 'doctor' atau 'customer'
      } else {
        throw Exception("User role not found");
      }
    } catch (e) {
      throw Exception("Failed to fetch user role: $e");
    }
  }

  Future<void> registerAsCustomer(
      String email,
      String password,
      String fullName,
      String bio,
      BuildContext context,
      ) async {
    _setLoading(true);
    _clearError();
    try {
      await registerCustomer(RegisterCustomerParams(
        email: email,
        password: password,
        fullName: fullName,
        bio: bio,
      ));
      Navigator.pop(context);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerAsDoctor(
      String email,
      String password,
      String fullName,
      String bio,
      String licenseNumber,
      String specialization,
      BuildContext context,
      ) async {
    _setLoading(true);
    _clearError();
    try {
      await registerDoctor(RegisterDoctorParams(
        email: email,
        password: password,
        fullName: fullName,
        bio: bio,
        licenseNumber: licenseNumber,
        specialization: specialization,
      ));
      Navigator.pop(context);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
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
