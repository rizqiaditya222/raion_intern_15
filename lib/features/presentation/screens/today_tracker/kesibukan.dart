import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class Kesibukan extends StatefulWidget {
  const Kesibukan({super.key});

  @override
  State<Kesibukan> createState() => _KesibukanState();
}

class _KesibukanState extends State<Kesibukan> {
  int selectedQuality = 1; // Default ke 1 (Worst)
  double sliderPosition = 0;
  bool isDragging = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        double sectionHeight = MediaQuery.of(context).size.height / 5;
        sliderPosition = (5 - selectedQuality) * (sectionHeight - 1) / 2;
      });
    });
  }

  int getQualityFromPosition(double position, double totalHeight) {
    double sectionHeight = totalHeight / 5;
    int section = 5 - (position ~/ sectionHeight).clamp(0, 4);
    return section;
  }

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
                    'Kesibukan',
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
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _buildQualityItem('Sangat\nsibuk'),
                                  _buildQualityItem('Sibuk'),
                                  _buildQualityItem('Normal'),
                                  _buildQualityItem('Tidak\nsibuk'),
                                  _buildQualityItem('Sangat\ntidak\nsibuk'),
                                ],
                              ),
                            ),
                            const SizedBox(width: 50),
                            Expanded(
                              flex: 2,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  _buildNumberCircle(5, constraints.maxHeight),
                                  _buildNumberCircle(4, constraints.maxHeight),
                                  _buildNumberCircle(3, constraints.maxHeight),
                                  _buildNumberCircle(2, constraints.maxHeight),
                                  _buildNumberCircle(1, constraints.maxHeight),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          left: constraints.maxWidth * 0.50,
                          top: 50,
                          bottom: 50,
                          child: GestureDetector(
                            onVerticalDragStart: (details) {
                              setState(() {
                                isDragging = true;
                                double newPosition = details.localPosition.dy;
                                sliderPosition = newPosition.clamp(
                                    0, constraints.maxHeight - 30);
                                selectedQuality = getQualityFromPosition(
                                    sliderPosition, constraints.maxHeight);
                              });
                            },
                            onVerticalDragUpdate: (details) {
                              setState(() {
                                double newPosition =
                                    sliderPosition + details.delta.dy;
                                sliderPosition = newPosition.clamp(
                                    0, constraints.maxHeight - 30);
                                selectedQuality = getQualityFromPosition(
                                    sliderPosition, constraints.maxHeight);
                              });
                            },
                            onVerticalDragEnd: (details) {
                              setState(() {
                                isDragging = false;
                                // Snap to nearest section
                                double sectionHeight =
                                    constraints.maxHeight / 5;
                                sliderPosition =
                                    (5 - selectedQuality) * sectionHeight +
                                        (sectionHeight - 30) / 2;
                                sliderPosition = sliderPosition.clamp(
                                    0, constraints.maxHeight - 30);
                              });
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                // Garis kuning (dasar)
                                Container(
                                  width: 32,
                                  height: constraints.maxHeight,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF4D160),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                // Efek loading biru (mengikuti slider dari bawah)
                                Positioned(
                                  left: 0,
                                  right: 0,
                                  bottom: 0,
                                  height: constraints.maxHeight -
                                      sliderPosition, // Efek loading dari bawah ke atas
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF0A2463),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                ),
                                // Slider indicator (di luar garis kuning)
                                Positioned(
                                  top: sliderPosition - 100,
                                  left:
                                      -7, // Posisikan di luar garis kuning (sebelah kiri)
                                  child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFF0A2463), // Warna biru gelap
                                      borderRadius: BorderRadius.circular(24),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 1,
                                          blurRadius: 3,
                                          offset: const Offset(0, 2),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              // Next button
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/catatan');
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
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQualityItem(String quality) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          quality,
          style: const TextStyle(
            fontSize: 24,
            color: Color(0xFF3D3B3B),
            fontWeight: FontWeight.w700,
            fontFamily: "Nunito",
          ),
        ),
      ],
    );
  }

  Widget _buildNumberCircle(int number, double maxHeight) {
    final bool isSelected = selectedQuality == number;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedQuality = number;
          // Hitung posisi slider berdasarkan pilihan nomor
          double sectionHeight = maxHeight / 5;
          sliderPosition = (5 - number) * sectionHeight;
          // Pusatkan slider dalam bagiannya
          sliderPosition += (sectionHeight - 30) / 2;
          // Pastikan tetap dalam batas
          sliderPosition = sliderPosition.clamp(0, maxHeight - 30);
        });
      },
      child: Container(
        width: 85,
        height: 85,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isSelected ? Color(0xFF627FA3) : const Color(0xFFE6F0FF),
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }
}
