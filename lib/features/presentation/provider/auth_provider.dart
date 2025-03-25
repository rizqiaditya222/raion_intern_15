import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:raion_intern_15/features/presentation/screens/homescreen/main_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import '../../data/models/user_model.dart';
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

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: "205023117718-6o0n56j736vhvg93s94q9ddh7flqvrpb.apps.googleusercontent.com"
  );

  User? get user => _auth.currentUser;

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
  Future<void> login(
      String email, String password, BuildContext context) async {
    _setLoading(true);
    _clearError();
    try {
      UserEntity user =
          await loginUser(LoginParams(email: email, password: password));

      await fetchUserProfile(user.id);

      if (user.role == UserRole.doctor) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const DoctorPage()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
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
      DocumentSnapshot userDoc =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();

      if (userDoc.exists && userDoc.data() != null) {
        return userDoc.get('role') ?? "";
      } else {
        throw Exception("User role not found");
      }
    } catch (e) {
      print("Error getting user role: $e");
      return "";
    }
  }

  Future<UserModel> registerCustomerManually({
    required String email,
    required String password,
    required String fullName,
    String? bio,
  }) async {
    try {
      final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userModel = UserModel(
          id: firebaseUser.uid,
          email: email,
          fullName: fullName,
          bio: bio ?? "",
          role: UserRole.customer,
        );

        await FirebaseFirestore.instance
            .collection('users')
            .doc(firebaseUser.uid)
            .set(userModel.toJson());

        print("User registered successfully: ${userModel.toJson()}");

        return userModel;
      } else {
        throw Exception("User registration failed, firebaseUser is null.");
      }
    } catch (e) {
      print("Error in registerCustomer: $e");
      rethrow;
    }
  }



  Future<void> saveUserToFirestore() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      DocumentReference userRef =
      FirebaseFirestore.instance.collection('users').doc(user.uid);

      await userRef.set({
        'uid': user.uid,
        'fullName': user.displayName,
        'email': user.email,
      }, SetOptions(merge: true));
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return;

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      final User? user = userCredential.user;

      if (user != null) {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'fullName': user.displayName ?? "User",
          'email': user.email,
          'role': "customer",
        }, SetOptions(merge: true));
      }

      notifyListeners();
      Navigator.pushReplacementNamed(context, '/main');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login gagal: $e")),
      );
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

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    notifyListeners();
  }
}


