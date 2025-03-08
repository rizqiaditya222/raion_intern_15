import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/features/presentation/provider/bottom_navbar.dart';
import 'package:raion_intern_15/features/presentation/screens/dummy.dart';
import 'package:raion_intern_15/features/presentation/screens/mood_screen/mood_screen.dart';
import 'package:raion_intern_15/features/presentation/screens/profile.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final List<Widget> screens = [
    Dummy(),
    Dummy(),
    MoodScreen(),
    ProfilePage(),
    Dummy(),
  ];

  @override
  Widget build(BuildContext context) {
    final bottomProvider = Provider.of<BottomNavbarProvider>(context);
    return Scaffold(
      body:
          screens[bottomProvider.currentIndex], // Menampilkan layar yang sesuai
      floatingActionButton: SizedBox(
        width: 65, // Atur lebar FAB
        height: 65, // Atur tinggi FAB
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
          child: Image.asset(happy, width: 65, height: 65), // Perbesar gambar
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, // Posisikan FAB di tengah
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: primary[90], // Warna latar belakang navbar
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: BottomNavigationBar(
            currentIndex: bottomProvider.currentIndex,
            onTap: (index) {
              bottomProvider.changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white,
            unselectedFontSize: 10,
            selectedItemColor: Colors.white,
            selectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(home, height: 24),
                label: "Beranda",
                activeIcon: Image.asset(profile_active, height: 26),
              ),
              BottomNavigationBarItem(
                icon: Image.asset(health, height: 24),
                label: "Konsultasi",
                activeIcon: Image.asset(profile_active, height: 26),
              ),
              BottomNavigationBarItem(
                icon: Container(width: 0), // Kosong untuk FAB
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Image.asset(book, height: 24),
                label: "Jurnal",
                activeIcon: Image.asset(profile_active, height: 26),
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
    );
  }
}
