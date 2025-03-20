import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/features/presentation/provider/bottom_navbar.dart';
import 'package:raion_intern_15/features/presentation/provider/mood_data_provider.dart';
import 'package:raion_intern_15/features/presentation/screens/beranda_screen/beranda_screen..dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/appointment_date.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/consultation.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/payment_success.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/search_doctor.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/specialization.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/stepper.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/upcoming_consultation.dart';
import 'package:raion_intern_15/features/presentation/screens/dummy.dart';
import 'package:raion_intern_15/features/presentation/screens/jurnal_screen/jurnal_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/mood_screen/calendar_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/mood_screen/mood_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/profile_screen.dart';

import '../../provider/mood_provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = [
    BerandaScreen(),
    Consultation(),
    MoodScreen(),
    JurnalScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomNavbarProvider>(context);
    final moodProvider = Provider.of<MoodDataProvider>(context);
    return Scaffold(
      body: screens[bottomProvider.currentIndex],
      floatingActionButton: Transform.translate(
        offset: Offset(0, -10),

        child: SizedBox(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            onPressed: () {
              bottomProvider.changeIndex(2);
            },
            backgroundColor: Colors.white,
            hoverColor: secondaryYellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
              side: BorderSide(color: Colors.white, width: 5),
            ),
            child: Image.asset(moodProvider.selectedMoodImage,
                width: 65, height: 65),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -10,
            left: 0,
            right: 0,
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                color: primary[90],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),

          Container(
            height: 80,
            decoration: BoxDecoration(
              color: primary[90],
            ),
            child: Theme(
              data: Theme.of(context).copyWith(

                splashFactory: NoSplash.splashFactory,
                highlightColor: Colors.transparent, 
              ),
              child: BottomNavigationBar(
                currentIndex: bottomProvider.currentIndex,
                onTap: (index) {
                  bottomProvider.changeIndex(index);
                },
                type: BottomNavigationBarType.fixed,
                backgroundColor: primary[90], // Sesuaikan warna navbar
                unselectedItemColor: Colors.white,
                unselectedFontSize: 10,
                selectedItemColor: Colors.white,
                selectedFontSize: 10,
                items: [
                  BottomNavigationBarItem(
                    icon: Image.asset(home, height: 24),
                    label: "Beranda",
                    activeIcon: Image.asset(home_active, height: 26),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(health, height: 24),
                    label: "Konsultasi",
                    activeIcon: Image.asset(health_active, height: 26),
                  ),
                  BottomNavigationBarItem(

                    icon: Container(width: 0),
                    label: "",
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(book, height: 24),
                    label: "Jurnal",
                    activeIcon: Image.asset(book_active, height: 26),
                  ),
                  BottomNavigationBarItem(
                    icon: Image.asset(profile, height: 24),
                    label: "Profil",
                    activeIcon: Image.asset(profile_active, height: 26),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}