import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

// Base class for result pages
abstract class BaseHasil extends StatefulWidget {
  const BaseHasil({super.key});
}

abstract class BaseHasilState<T extends BaseHasil> extends State<T> {
  // Common method to build the yellow "Kembali" button
  Widget buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, '/main');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: secondaryYellow[50],
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Kembali',
          style: TextStyle(
            fontSize: 16,
            fontFamily: "Nunito",
            fontWeight: FontWeight.bold,
            color: Color(0xFF193A63),
          ),
        ),
      ),
    );
  }

  // Common method to build the top image container
  Widget buildTopImage() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      padding: const EdgeInsets.only(top: 20),
      child: Center(
        child: Image.asset(
          "lib/assets/images/test_result/deepbreath.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
