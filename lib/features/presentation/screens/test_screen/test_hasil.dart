import 'package:flutter/material.dart';
import 'dart:async';
import 'package:raion_intern_15/assets/color.dart';

class TestHasil extends StatefulWidget {
  const TestHasil({super.key});

  @override
  State<TestHasil> createState() => _TestHasilState();
}

class _TestHasilState extends State<TestHasil> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  Timer? _timer;
  Timer? _idleTimer;

  @override
  void initState() {
    super.initState();

    // Start the auto-sliding timer
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });

    // Start the idle timer immediately
    _startIdleTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _idleTimer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startIdleTimer() {
    _idleTimer?.cancel();
    _idleTimer = Timer(const Duration(seconds: 10), () {
      Navigator.pushReplacementNamed(context, '/main');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Image at the top with fixed height
            Container(
              height: MediaQuery.of(context).size.height *
                  0.3, // 30% of screen height
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Image.asset(
                  "lib/assets/images/test_result/deepbreath.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // Sliding content takes remaining space
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: [
                  // First page
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
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
                        ],
                      ),
                    ),
                  ),
                  // Second page
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
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
                        ],
                      ),
                    ),
                  ),
                  // Third page
                  SingleChildScrollView(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      child: Column(
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
                            width: double.infinity, // Full width
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
                                  LayoutBuilder(
                                      builder: (context, constraints) {
                                    return Container(
                                      height: 14,
                                      width: constraints.maxWidth *
                                          0.8, // 50% of total width
                                      decoration: BoxDecoration(
                                        color: secondaryYellow[50],
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                    );
                                  }),
                                  // Score indicator
                                  LayoutBuilder(
                                      builder: (context, constraints) {
                                    return Positioned(
                                      left: (constraints.maxWidth * 0.87),
                                      top: -25,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 4),
                                        decoration: BoxDecoration(
                                          color: secondaryYellow[50],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.1),
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
                                          "20-30 = Gaya hidup sangat tidak sehat           \n"),
                                  TextSpan(
                                      text:
                                          "31-50 = Gaya hidup kurang sehat           \n"),
                                  TextSpan(
                                      text:
                                          "51-69 = Gaya hidup cukup buruk           \n"),
                                  TextSpan(
                                      text:
                                          "70-89 = Gaya hidup sehat           \n"),
                                  TextSpan(
                                      text:
                                          "90-100 = Gaya hidup sangat sehat           \n"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // // Page indicator dots
            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: List.generate(
            //         3,
            //         (index) => Container(
            //               margin: const EdgeInsets.symmetric(horizontal: 4),
            //               width: 8,
            //               height: 8,
            //               decoration: BoxDecoration(
            //                 shape: BoxShape.circle,
            //                 color: _currentPage == index
            //                     ? primary[90]
            //                     : Colors.grey[300],
            //               ),
            //             )),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
