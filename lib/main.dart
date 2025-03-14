import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raion_intern_15/assets/themeData.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnal_manager.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnal_screen.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnalselect.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnaltext.dart';
import 'package:raion_intern_15/features/presentation/jurnal_screen/jurnalvoice.dart';
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
import 'package:raion_intern_15/features/presentation/screens/mood_screen/mood_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/onboardingpage.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/akun.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/faq.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/privacy_policy.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/profile_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/term_of_service.dart';
import 'features/presentation/screens/login_screen/login_page.dart';
import 'features/presentation/screens/signup_screen/sign_up_patients.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/presentation/provider/auth_provider.dart';
import 'di/injection_container.dart' as di;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        ChangeNotifierProvider(create: (context) => StepProvider()),
        ChangeNotifierProvider(
            create: (context) =>
                JournalSaveProvider()), 
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
                return user != null ? DoctorProfile() : DoctorProfile();
              },
            );
          },
        ),
        routes: {
          '/registerPatient': (context) => const RegisterCustomerScreen(),
          '/login': (context) => const LoginPage(),
          '/moodScreen': (context) => MoodScreen(),
          '/loading': (context) => LoadingScreen(),
          '/information': (context) => InformationForm(),
          '/specialization': (context) => Specialization(),
          '/step': (context) => StepperScreen(),
          '/success': (context) => PaymentSuccess(),
          '/search': (context) => SearchDoctor(),
          '/main': (context) => MainScreen(),
          '/moodScreen': (context) => MoodScreen(),
          '/faq': (context) => const Faq(),
          '/privacypolicy': (context) => const PrivacyPolicy(),
          '/termofService': (context) => const TermOfService(),
          '/akun': (context) => const Akun(),
          '/jurnalselect': (context) => const Jurnalselect(),
          '/jurnalvoice': (context) => const Jurnalvoice(),
          '/jurnaltext': (context) => const Jurnaltext(),
          '/jurnalscreen': (context) => const JurnalScreen(),
          '/jurnalmanager': (context) => const JurnalManager(),

        },
      ),
    );
  }
}
