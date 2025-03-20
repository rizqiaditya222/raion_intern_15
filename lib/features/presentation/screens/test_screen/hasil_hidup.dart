import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/Base_hasil.dart';

class HasilHidup extends BaseHasil {
  const HasilHidup({super.key});

  @override
  State<HasilHidup> createState() => _HasilHidupState();
}

class _HasilHidupState extends BaseHasilState<HasilHidup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Gambar di atas
            buildTopImage(),

            // Expanded untuk konten utama
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Ini adalah hasil test kamu!',
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: "Nunito",
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Progress Bar
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      constraints: const BoxConstraints(maxWidth: 459),
                      height: 113,
                      decoration: BoxDecoration(
                        color: primary[90],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Stack(
                          children: [
                            // Progress bar background
                            Container(
                              height: 14,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            // Progress bar fill
                            LayoutBuilder(builder: (context, constraints) {
                              return Container(
                                height: 14,
                                width: constraints.maxWidth * 0.8,
                                decoration: BoxDecoration(
                                  color: secondaryYellow[50],
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              );
                            }),
                            // Score indicator
                            LayoutBuilder(builder: (context, constraints) {
                              return Positioned(
                                left: (constraints.maxWidth * 0.87),
                                top: -25,
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: secondaryYellow[50],
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        offset: const Offset(0, 2),
                                      ),
                                    ],
                                  ),
                                  child: const Text(
                                    '87',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Nunito",
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            }),
                            // Start and end labels
                            const Positioned(
                              left: 0,
                              bottom: -20,
                              child: Text(
                                '0',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontFamily: "Nunito",
                                ),
                              ),
                            ),
                            const Positioned(
                              right: 0,
                              bottom: -20,
                              child: Text(
                                '100',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: "Nunito",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Deskripsi hasil
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: const TextSpan(
                          style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                                text:
                                    "20-30 = Gaya hidup sangat tidak sehat                            \n"),
                            TextSpan(
                                text:
                                    "31-50 = Gaya hidup kurang sehat                            \n"),
                            TextSpan(
                                text:
                                    "51-69 = Gaya hidup cukup buruk                            \n"),
                            TextSpan(
                                text:
                                    "70-89 = Gaya hidup sehat                            \n"),
                            TextSpan(
                                text:
                                    "90-100 = Gaya hidup sangat sehat                            \n"),
                          ],
                        ),
                      ),
                    ),

                    Spacer(), // Menjaga tombol tetap di bawah

                    Center(child: buildBackButton(context)),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
