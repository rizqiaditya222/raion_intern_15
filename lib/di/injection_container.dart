
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
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

  // Repository Layer
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  // Use Cases
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl()));
  sl.registerLazySingleton<RegisterCustomer>(() => RegisterCustomer(sl()));
  sl.registerLazySingleton<RegisterDoctor>(() => RegisterDoctor(sl()));

  // Providers
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider(
    loginUser: sl(),
    registerCustomer: sl(),
    registerDoctor: sl()
  ));
}
