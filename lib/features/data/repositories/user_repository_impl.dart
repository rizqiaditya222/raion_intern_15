import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:raion_intern_15/features/domain/repositorires/user_repository.dart';
import '../../domain/entities/user.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final FirebaseFirestore firestore;

  UserRepositoryImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<UserEntity> getUserProfile(String userId) async {
    try {
      final userDoc = await firestore.collection('users').doc(userId).get();

      if (!userDoc.exists || userDoc.data() == null) {
        throw Exception("User not found");
      }

      final userData = userDoc.data()!;
      return UserModel.fromJson(userData);
    } catch (e) {
      throw Exception("Error fetching user profile: $e");
    }
  }
}
