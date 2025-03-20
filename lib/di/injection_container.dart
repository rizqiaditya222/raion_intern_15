
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:raion_intern_15/features/data/repositories/appointment_repository_impl.dart';
import 'package:raion_intern_15/features/data/repositories/doctor_repository_impl.dart';
import 'package:raion_intern_15/features/data/repositories/user_repository_impl.dart';
import 'package:raion_intern_15/features/domain/repositorires/appointment_repository.dart';
import 'package:raion_intern_15/features/domain/repositorires/doctor_repository.dart';
import 'package:raion_intern_15/features/domain/repositorires/user_repository.dart';
import 'package:raion_intern_15/features/domain/usecases/create_appointment.dart';
import 'package:raion_intern_15/features/domain/usecases/get_appoinment.dart';
import 'package:raion_intern_15/features/domain/usecases/get_doctor.dart';
import 'package:raion_intern_15/features/domain/usecases/get_user_profile.dart';
import 'package:raion_intern_15/features/domain/usecases/register_doctor.dart';
import 'package:raion_intern_15/features/domain/usecases/register_user.dart';
import 'package:raion_intern_15/features/presentation/provider/appointment_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/create_appoinment_provider.dart';

import '../features/data/datasources/firebase_auth_service.dart';
import '../features/data/repositories/auth_repository_impl.dart';
import '../features/domain/repositorires/auth_repository.dart';
import '../features/domain/usecases/login_user.dart';
import '../features/presentation/provider/auth_provider.dart';
import '../features/presentation/provider/doctor_provider.dart';

final sl = GetIt.instance;

void setupDependencyInjection() {
  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Data Layer
  sl.registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl<FirebaseAuthService>()));
sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(firestore: sl<FirebaseFirestore>()));
sl.registerLazySingleton<DoctorRepository>(() => DoctorRepositoryImpl(firestore: sl<FirebaseFirestore>()));
sl.registerLazySingleton<AppointmentRepository>(() => AppointmentRepositoryImpl(firestore: sl<FirebaseFirestore>()));

  // Use Cases
  sl.registerLazySingleton<LoginUser>(() => LoginUser(sl<AuthRepository>()));
  sl.registerLazySingleton<RegisterCustomer>(() => RegisterCustomer(sl<AuthRepository>()));
  sl.registerLazySingleton<RegisterDoctor>(() => RegisterDoctor(sl<AuthRepository>()));
  sl.registerLazySingleton<GetUserProfile>(() => GetUserProfile(sl<UserRepository>()));
  sl.registerLazySingleton<GetDoctor>(() => GetDoctor(sl<DoctorRepository>()));
  sl.registerLazySingleton<GetAppoinment>(() => GetAppoinment(sl<AppointmentRepository>()));
  sl.registerLazySingleton<CreateAppointment>(() => CreateAppointment(sl<AppointmentRepository>()));

  // Providers
  sl.registerLazySingleton<AuthProvider>(() => AuthProvider(
    getUserProfile: sl<GetUserProfile>(),
    loginUser: sl<LoginUser>(),
    registerCustomer: sl<RegisterCustomer>(),
    registerDoctor: sl<RegisterDoctor>(),
  ));

  sl.registerLazySingleton<DoctorProvider>(() => DoctorProvider(getDoctor: sl<GetDoctor>()));
  sl.registerLazySingleton<CreateAppoinmentProvider>(() => CreateAppoinmentProvider(
    repository: sl<AppointmentRepository>(),
    createAppointmentUseCase: sl<CreateAppointment>(),
    getAppoinment: sl<GetAppoinment>()
  ));

}
