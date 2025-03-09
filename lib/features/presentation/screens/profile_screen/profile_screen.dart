import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/profilebutton.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary[10],
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background container (header)
          Container(
            height: 200,
            width: double.infinity,
            color: primary[90],
          ),
          // Main content with buttons
          Column(
            children: [
              const SizedBox(height: 140),
              Expanded(
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width > 378
                        ? MediaQuery.of(context).size.width * 0.9
                        : 378,
                    height: 600,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        YellowButton(
                          text: 'Edit Profile',
                          icon: Icons.edit,
                          onPressed: () {},
                        ),
                        YellowButton(
                          text: 'FAQ',
                          icon: Icons.question_mark,
                          onPressed: () {},
                        ),
                        YellowButton(
                          text: 'Privacy Policy',
                          icon: Icons.shield_outlined,
                          onPressed: () {},
                        ),
                        YellowButton(
                          text: 'Term of Service',
                          icon: Icons.description_outlined,
                          onPressed: () {},
                        ),
                        YellowButton(
                          text: 'Log Out',
                          icon: Icons.logout,
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          // Profile Picture
          Positioned(
            top: 15,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: primary[10],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 4,
                    spreadRadius: 2,
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
