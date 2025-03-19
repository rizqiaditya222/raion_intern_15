import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/profilebutton.dart';

import '../../provider/auth_provider.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}



class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                // Profile picture and name
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                          border:
                              Border.all(color: Colors.grey.shade300, width: 1),
                        ),
                        child: Icon(Icons.person, size: 60, color: Colors.grey),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        user?.fullName ?? 'Anonim',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Informasi Pribadi',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Nunito",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProfileButton(
                    text: 'Akun',
                    icon: Icons.person,
                    onPressed: () {
                      Navigator.pushNamed(context, '/akun');
                    },
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Dukungan',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProfileButton(
                    text: 'FAQ',
                    icon: Icons.question_answer,
                    onPressed: () {
                      Navigator.pushNamed(context, '/faq');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProfileButton(
                    text: 'Term of Service',
                    icon: Icons.description_outlined,
                    onPressed: () {
                      Navigator.pushNamed(context, '/termofService');
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ProfileButton(
                    text: 'Privacy Policy',
                    icon: Icons.shield_outlined,
                    onPressed: () {
                      Navigator.pushNamed(context, '/privacypolicy');
                    },
                  ),
                ),
                const SizedBox(height: 16),
                // Logout button
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Keluar',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 35)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
