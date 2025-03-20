import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class FirebaseAuthService {
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  FirebaseAuthService({firebase_auth.FirebaseAuth? firebaseAuth})
      : _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance;

  Future<UserModel> registerCustomer({
    required String email,
    required String password,
    required String fullName,
    String? bio,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userModel = UserModel(
          id: firebaseUser.uid,
          email: email,
          fullName: fullName,
          bio: bio,
          role: UserRole.customer,
        );

        await _firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .set(userModel.toJson());

        return userModel;
      } else {
        throw Exception('User registration failed');
      }
    } catch (e) {
      throw Exception('Error registering customer: $e');
    }
  }

  Future<UserModel> registerDoctor({
    required String email,
    required String password,
    required String fullName,
    required String bio,
    required String licenseNumber,
    required String specialization,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userModel = UserModel(
          id: firebaseUser.uid,
          email: email,
          fullName: fullName,
          bio: bio,
          role: UserRole.doctor,
          licenseNumber: licenseNumber,
          specialization: specialization,
        );

        await _firestore
            .collection('users')
            .doc(firebaseUser.uid)
            .set(userModel.toJson());

        return userModel;
      } else {
        throw Exception('User registration failed');
      }
    } catch (e) {
      throw Exception('Error registering doctor: $e');
    }
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final firebaseUser = userCredential.user;

      if (firebaseUser != null) {
        final userDoc =
            await _firestore.collection('users').doc(firebaseUser.uid).get();

        if (!userDoc.exists) {
          throw Exception('User data not found');
        }

        final userData = userDoc.data()!;
        return UserModel.fromJson(userData);
      } else {
        throw Exception('User login failed');
      }
    } catch (e) {
      throw Exception('Error logging in user: $e');
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
