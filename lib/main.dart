import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raion_intern_15/assets/themeData.dart';
import 'package:raion_intern_15/features/domain/usecases/create_appointment.dart';
import 'package:raion_intern_15/features/domain/usecases/get_appoinment.dart';
import 'package:raion_intern_15/features/presentation/provider/appointment_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/date_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/doctor_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/form_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/payment_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/specialization_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/create_appoinment_provider.dart';
import 'package:raion_intern_15/features/presentation/screens/artikel_screen/artikel_bipolar.dart';
import 'package:raion_intern_15/features/presentation/screens/artikel_screen/artikel_mental.dart';
import 'package:raion_intern_15/features/presentation/screens/artikel_screen/artikel_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/artikel_screen/list_artikel.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/end_session.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/upcoming_consultation.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnal_manager.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnal_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnalselect.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnaltext.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnalvoice.dart';
import 'package:raion_intern_15/features/presentation/provider/bottom_navbar.dart';
import 'package:raion_intern_15/features/presentation/provider/mood.provider.dart';
import 'package:raion_intern_15/features/presentation/provider/step_provider.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/doctor_profile.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/information_form.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/loading_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/payment_success.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/search_doctor.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/specialization.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/stepper.dart';
import 'package:raion_intern_15/features/presentation/screens/homescreen/main_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/meditasi_screen/audio_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/meditasi_screen/meditasi_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/meditasi_screen/video_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/mood_screen/mood_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/onboardingpage.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/akun.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/faq.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/privacy_policy.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/profile_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/term_of_service.dart';
import 'features/domain/repositorires/appointment_repository.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/hasil_hidup.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/hasil_negatif.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/hasil_positif.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/test_gaya_hidup.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/test_negatif.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/test_positif.dart';
import 'package:raion_intern_15/features/presentation/screens/today_tracker/catatan.dart';
import 'package:raion_intern_15/features/presentation/screens/today_tracker/kesibukan.dart';
import 'package:raion_intern_15/features/presentation/screens/today_tracker/sleep_tracker.dart';
import 'package:raion_intern_15/features/presentation/screens/today_tracker/stress_level.dart';
import 'features/domain/usecases/get_doctor.dart';
import 'features/presentation/screens/login_screen/login_page.dart';
import 'features/presentation/screens/profile_screen/faq_bagaimana.dart';
import 'features/presentation/screens/profile_screen/faq_payment.dart';
import 'features/presentation/screens/profile_screen/faq_pengenalan.dart';
import 'features/presentation/screens/signup_screen/sign_up_patients.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/presentation/provider/auth_provider.dart';
import 'di/injection_container.dart' as di;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('id_ID', null);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  di.setupDependencyInjection();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: di.sl<AuthProvider>(),
        ),
        ChangeNotifierProvider(create: (context) => BottomNavbarProvider()),
        ChangeNotifierProvider(create: (context) => MoodProvider()),
        ChangeNotifierProvider(create: (context) => DateProvider()),
        ChangeNotifierProvider(create: (context) => StepProvider()),
        ChangeNotifierProvider(create: (context) => InformationFormProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => SpecializationProvider()),
        ChangeNotifierProvider(create: (context) => AppointmentProvider()),
        ChangeNotifierProvider(create: (context) => CreateAppoinmentProvider(createAppointmentUseCase: di.sl<CreateAppointment>(), getAppoinment: di.sl<GetAppoinment>(), repository: di.sl<AppointmentRepository>()),),
        ChangeNotifierProvider(create: (context) => DoctorProvider(getDoctor: di.sl<GetDoctor>())),
        ChangeNotifierProvider(create: (context) => JournalSaveProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health App',
        theme: AppTheme.lighTheme,
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return StreamBuilder<firebase_auth.User?>(
              stream: firebase_auth.FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return const Scaffold(
                //     body: Center(child: CircularProgressIndicator()),
                //   );
                // }
                if (snapshot.hasError) {
                  return const Scaffold(
                    body: Center(child: Text('Something went wrong!')),
                  );
                }
                final user = snapshot.data;
                return user != null ? LoginPage() : LoginPage();
              },
            );
          },
        ),
        routes: {
          '/registerPatient': (context) => const RegisterCustomerScreen(),
          '/login': (context) => LoginPage(),
          '/moodScreen': (context) => MoodScreen(),
          '/loading': (context) => LoadingScreen(),
          '/information': (context) => InformationForm(),
          '/specialization': (context) => Specialization(),
          '/step': (context) => StepperScreen(),
          '/success': (context) => PaymentSuccess(),
          '/search': (context) => SearchDoctor(),
          '/main': (context) => MainScreen(),
          '/faq': (context) => const Faq(),
          '/faqpengenalan': (context) => const FaqPengenalan(),
          '/faqbagaimana': (context) => const FaqBagaimana(),
          '/faqpayment': (context) => const FaqPayment(),
          '/privacypolicy': (context) => const PrivacyPolicy(),
          '/termofService': (context) => const TermOfService(),
          '/akun': (context) => const Akun(),
          '/jurnalselect': (context) => const Jurnalselect(),
          '/jurnalvoice': (context) => const Jurnalvoice(),
          '/jurnaltext': (context) => const Jurnaltext(),
          '/jurnalscreen': (context) => const JurnalScreen(),
          '/jurnalmanager': (context) => const JurnalManager(),
          '/profile': (context) => DoctorProfile(),
          '/profileuser': (context) => ProfileScreen(),
          '/testpositif': (context) => const TestPositif(),
          '/testnegatif': (context) => const TestNegatif(),
          '/testhidup': (context) => const TestGayaHidup(),
          '/hasilnegatif': (context) => const HasilNegatif(),
          '/hasilpositif': (context) => const HasilPositif(),
          '/hasilhidup': (context) => const HasilHidup(),
          '/artikel': (context) => const ArtikelScreen(),
          '/artikelmental': (context) => const ArtikelMental(),
          '/artikelbipolar': (context) => const ArtikelBipolar(),
          '/listartikel': (context) => const ListArtikel(),
          '/meditasi': (context) => const MeditasiScreen(),
          '/audio': (context) => const AudioScreen(),
          '/video': (context) => const VideoScreen(),
          '/sleeptracker': (context) => const SleepTracker(),
          '/kesibukantracker': (context) => const Kesibukan(),
          '/stresslevel': (context) => const StressLevel(),
          '/catatan': (context) => const Catatan(),
          '/end': (context) => const EndSession(),
        },
      ),
    );
  }
}
