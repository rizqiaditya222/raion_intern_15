import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/widgets/loading_indicator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height / 2 -
                25, // Menyesuaikan agar di tengah
            left: MediaQuery.of(context).size.width / 2 -
                50, // Menyesuaikan agar di tengah
            child: Container(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const LoadingIndicator(
                progress: 0.1, // 10% progress
              ),
            ),
          ),
        ],
      ),
    );
  }
}
