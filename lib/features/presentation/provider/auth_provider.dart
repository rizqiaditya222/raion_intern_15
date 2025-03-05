import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecases/login_user.dart';
import '../../domain/usecases/register_doctor.dart';
import '../../domain/usecases/register_user.dart';
import '../screens/homescreen/doctor_page.dart';
import '../screens/homescreen/patient_page.dart';
import '../../domain/usecases/get_user_profile.dart';


class AuthProvider with ChangeNotifier {
  final LoginUser loginUser;
  final RegisterCustomer registerCustomer;
  final RegisterDoctor registerDoctor;
  final GetUserProfile getUserProfile;

  UserEntity? _currentUser;
  UserEntity? get currentUser => _currentUser;


  bool _isLoading = false;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  AuthProvider({
    required this.getUserProfile,
    required this.loginUser,
    required this.registerCustomer,
    required this.registerDoctor,
  });

  Future<void> fetchUserProfile(String userId) async {
  _setLoading(true);
  _clearError();
  try {
    UserEntity user = await getUserProfile(userId);
    _currentUser = user;  
    notifyListeners();
  } catch (e) {
    _setError(e.toString());
  } finally {
    _setLoading(false);
  }
}

Future<void> login(String email, String password, BuildContext context) async {
  _setLoading(true);
  _clearError();
  try {
    UserEntity user = await loginUser(LoginParams(email: email, password: password));
    
    // Fetch user profile setelah login berhasil
    await fetchUserProfile(user.id);

    if (user.role == UserRole.doctor) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const DoctorPage()),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => ProfilePage()),
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

  Future<String> getUserRole(String uid) async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users') // Pastikan koleksi Firestore benar
          .doc(uid) // Gunakan UID, bukan email
          .get();

      if (userDoc.exists && userDoc.data() != null) {
        return userDoc.get('role') ?? "";
      } else {
        throw Exception("User role not found");
      }
    } catch (e) {
      print("Error getting user role: $e");
      return ""; // Kembalikan string kosong agar tidak menyebabkan error lebih lanjut
    }
  }

  Future<void> registerAsCustomer(
    String email,
    String password,
    String fullName,
    BuildContext context,
  ) async {
    _setLoading(true);
    _clearError();
    try {
      await registerCustomer(RegisterCustomerParams(
        email: email,
        password: password,
        fullName: fullName,
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
