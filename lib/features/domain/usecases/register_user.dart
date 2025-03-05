import '../../../core/usecases/usecases.dart';
import '../entities/user.dart';
import '../repositorires/auth_repository.dart';

class RegisterCustomer implements UseCase<UserEntity, RegisterCustomerParams> {
  final AuthRepository repository;

  RegisterCustomer(this.repository);

  @override
  Future<UserEntity> call(RegisterCustomerParams params) async {
    return await repository.registerCustomer(
      email: params.email,
      password: params.password,
      fullName: params.fullName,
    );
  }
}

class RegisterCustomerParams {
  final String email;
  final String password;
  final String fullName;

  RegisterCustomerParams({
    required this.email,
    required this.password,
    required this.fullName,
  });
}
