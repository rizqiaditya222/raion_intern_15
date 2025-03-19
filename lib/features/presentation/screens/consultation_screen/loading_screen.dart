import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary[90], // Mengubah warna latar belakang
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(logoIcon),
              Text("Mencari Ahli...", style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white)),
              Text("Tunggu sebentar ya, kami sedang mencarikan psikolog terbaik untukmu!", 
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: Colors.white), 
                  textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
