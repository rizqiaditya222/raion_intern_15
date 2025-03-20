import 'package:flutter/material.dart';

class StressLevel extends StatefulWidget {
  const StressLevel({super.key});

  @override
  State<StressLevel> createState() => _StressLevelState();
}

class _StressLevelState extends State<StressLevel> {
  int selectedLevel = 5; // Default selected level

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                          size: 20,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                  const Text(
                    'Level Stress',
                    style: TextStyle(
                      color: Color(0xFF193A63),
                      fontFamily: "Nunito",
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        // Konten utama
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Pertanyaan
                            const Center(
                              child: Text(
                                textAlign: TextAlign.center,
                                'Bagaimana kamu menilai level\nstress kamu?',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF193A63),
                                  fontFamily: "Nunito",
                                  height: 1.3,
                                ),
                              ),
                            ),

                            Expanded(
                              child: Center(
                                child: Text(
                                  selectedLevel.toString(),
                                  style: const TextStyle(
                                    fontSize: 200,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito",
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ),

                            // Selector level stress
                            Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFD4E6FE),
                                borderRadius: BorderRadius.circular(1234),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: List.generate(5, (index) {
                                  final level = index + 1;
                                  final isSelected = selectedLevel == level;

                                  return GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedLevel = level;
                                      });
                                    },
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: isSelected
                                            ? const Color(0xFFF4D160)
                                            : Colors.transparent,
                                      ),
                                      child: Center(
                                        child: Text(
                                          level.toString(),
                                          style: const TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Deskripsi stress level
                            const Center(
                              child: Text(
                                'Stress berlebihan',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xFF193A63),
                                  fontWeight: FontWeight.w600,
                                  fontFamily: "Nunito",
                                ),
                              ),
                            ),
                            const SizedBox(height: 60),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),

              // Tombol Selanjutnya
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/kesibukantracker');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF4D160),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Selanjutnya',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF355A89),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
