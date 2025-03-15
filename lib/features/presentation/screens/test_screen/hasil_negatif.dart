import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/Base_hasil.dart';

class HasilNegatif extends BaseHasil {
  const HasilNegatif({super.key});

  @override
  State<HasilNegatif> createState() => _HasilNegatifState();
}

class _HasilNegatifState extends BaseHasilState<HasilNegatif> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top image
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
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: 380,
                      height: 73,
                      decoration: BoxDecoration(
                        color: primary[90],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text(
                          '17',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
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
                                    "Berikut penjelasan terkait skor kamu:\n"),
                            TextSpan(
                                text:
                                    " • Jika skor kamu antara 0-13, berarti tingkat stres kamu rendah.\n"),
                            TextSpan(
                                text:
                                    " • Jika skor kamu antara 14-26, berarti kamu mengalami stres sedang.\n"),
                            TextSpan(
                                text:
                                    " • Jika skor kamu antara 27-40, berarti kamu mengalami stres yang tinggi.\n"),
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
