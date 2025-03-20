import 'package:flutter/material.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/Base_hasil.dart';

class HasilPositif extends BaseHasil {
  const HasilPositif({super.key});

  @override
  State<HasilPositif> createState() => _HasilPositifState();
}

class _HasilPositifState extends BaseHasilState<HasilPositif> {
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
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Hasil test kamu rata-rata!',
                        style: TextStyle(
                          fontSize: 24,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
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
                                      "Kebanyakan orang mendapatkan skor 40-60. Dan kamu mendapatkan 49!\n\n"),
                              TextSpan(
                                  text:
                                      "Ada beberapa cara untuk meningkatkan kesehatan mental kamu:\n"),
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
            ),
          ],
        ),
      ),
    );
  }
}
