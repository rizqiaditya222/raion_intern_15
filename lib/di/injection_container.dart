
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:raion_intern_15/features/data/repositories/user_repository_impl.dart';
import 'package:raion_intern_15/features/domain/repositorires/user_repository.dart';
import 'package:raion_intern_15/features/domain/usecases/get_user_profile.dart';
import 'package:raion_intern_15/features/domain/usecases/register_doctor.dart';
import 'package:raion_intern_15/features/domain/usecases/register_user.dart';

import '../features/data/datasources/firebase_auth_service.dart';
import '../features/data/repositories/auth_repository_impl.dart';
import '../features/domain/repositorires/auth_repository.dart';
import '../features/domain/usecases/login_user.dart';
import '../features/presentation/provider/auth_provider.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Layer
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());

  // Repository Layer (Pastikan AuthService sudah terdaftar sebelum ini)
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<FirebaseAuthService>()));

sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(firestore: sl<FirebaseFirestore>()));

  // Use Cases
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl<AuthRepository>()));
  sl.registerLazySingleton<RegisterCustomer>(() => RegisterCustomer(sl<AuthRepository>()));
  sl.registerLazySingleton<RegisterDoctor>(() => RegisterDoctor(sl<AuthRepository>()));
  sl.registerLazySingleton<GetUserProfile>(() => GetUserProfile(sl<UserRepository>()));

  // Providers
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider(
    getUserProfile: sl<GetUserProfile>(),
    loginUser: sl<LoginUser>(),
    registerCustomer: sl<RegisterCustomer>(),
    registerDoctor: sl<RegisterDoctor>(),
  ));
}
