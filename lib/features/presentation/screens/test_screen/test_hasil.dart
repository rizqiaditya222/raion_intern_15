import 'package:flutter/material.dart';

class TestHasil extends StatefulWidget {
  const TestHasil({super.key});

  @override
  State<TestHasil> createState() => _TestHasilState();
}

class _TestHasilState extends State<TestHasil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 80,
            left: 0,
            right: 0,
            child: Center(
              child:
                  Image.asset("lib/assets/images/test_result/deepbreath.png"),
            ),
          ),
        ],
      ),
    );
  }
}
