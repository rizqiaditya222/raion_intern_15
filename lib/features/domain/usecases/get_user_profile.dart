import 'package:raion_intern_15/features/domain/repositorires/user_repository.dart';
import '../entities/user.dart';


class GetUserProfile {
  final UserRepository repository;

  GetUserProfile(this.repository);

  Future<UserEntity> call(String userId) async {
    return await repository.getUserProfile(userId);
  }
}
