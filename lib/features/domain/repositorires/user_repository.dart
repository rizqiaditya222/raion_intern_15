import '../entities/user.dart';

abstract class UserRepository {
  Future<UserEntity> getUserProfile(String userId);

}
