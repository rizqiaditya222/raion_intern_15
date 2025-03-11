import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class ProfileButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onPressed;
  final Color? badgeColor;

  const ProfileButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.onPressed,
    this.badgeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 64,
      margin: const EdgeInsets.only(bottom: 22),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1234),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: const BoxDecoration(
                color: Color(0xFFF7F4F2),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 20,
                  color: primary[90],
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nutino",
                  color: primary[90],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
