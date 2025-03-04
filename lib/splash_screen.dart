import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'features/presentation/screens/homescreen/doctor_page.dart';
import 'features/presentation/screens/homescreen/patient_page.dart';
import 'features/presentation/screens/login_screen/login_page.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _checkAuthUser();
  }

  Future<void> _checkAuthUser() async {
    User? user = _auth.currentUser;
    
    if (user == null){
      await Future.delayed(Duration(seconds: 3));
      _navigateToLogin();
    } else {
      DatabaseReference userRef = _database.child("Doctor").child(user.uid);
      DataSnapshot snapshot = await userRef.get();
      
      if (snapshot.exists){
        await Future.delayed(Duration(seconds: 3));
        _navigateToDoctor();
      } else {
        userRef = _database.child("Patient").child(user.uid);
        snapshot = await userRef.get();
        _navigateToPatient();
        if(snapshot.exists){
          await Future.delayed(Duration(seconds: 3));
          _navigateToLogin();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator()
      )
    );
  }

  void _navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> LoginPage()));
  }

  void _navigateToDoctor() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> DoctorPage()));
  }

  void _navigateToPatient() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PatientPage()));
  }

}

