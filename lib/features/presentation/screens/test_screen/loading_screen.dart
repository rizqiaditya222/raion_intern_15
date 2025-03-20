import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/widgets/loading_indicator.dart';

class LoadingScreen extends StatefulWidget {
  final String nextRoute; // Tambahkan parameter untuk halaman tujuan

  const LoadingScreen({super.key, required this.nextRoute});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, widget.nextRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: const LoadingIndicator(progress: 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
