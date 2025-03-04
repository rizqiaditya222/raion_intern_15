import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import 'features/presentation/screens/login_screen/login_page.dart';
import 'features/presentation/screens/signup_screen/sign_up_doctor.dart';
import 'features/presentation/screens/signup_screen/sign_up_patients.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'features/presentation/provider/auth_provider.dart';
import 'features/presentation/screens/homescreen/doctor_page.dart';
import 'features/presentation/screens/homescreen/patient_page.dart';
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
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mental Health App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: Consumer<AuthProvider>(
          builder: (context, authProvider, _) {
            return StreamBuilder<firebase_auth.User?>(
              stream: firebase_auth.FirebaseAuth.instance.authStateChanges(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(
                    body: Center(child: CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return const Scaffold(
                    body: Center(child: Text('Something went wrong!')),
                  );
                }
                final user = snapshot.data;
                if (user != null) {
                  return FutureBuilder(
                    future: authProvider.getUserRole(user.uid!),
                    builder: (context, AsyncSnapshot<String> roleSnapshot) {
                      if (roleSnapshot.connectionState == ConnectionState.waiting) {
                        return const Scaffold(
                          body: Center(child: CircularProgressIndicator()),
                        );
                      }
                      if (roleSnapshot.hasError || !roleSnapshot.hasData) {
                        return const Scaffold(
                          body: Center(child: Text('Failed to get user role')),
                        );
                      }
                      return roleSnapshot.data == 'doctor'
                          ? ProfilePage()
                          : const PatientPage();
                    },
                  );
                } else {
                  return const LoginPage();
                }
              },
            );
          },
        ),
        routes: {
          '/registerDoctor': (context) => const RegisterDoctorScreen(),
          '/registerPatient': (context) => const RegisterCustomerScreen(),
        },
      ),
    );
  }
}
