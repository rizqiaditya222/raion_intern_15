import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/features/presentation/provider/mood_data_provider.dart';

class MoodScreen extends StatefulWidget {
  MoodScreen({super.key});

  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Color> backgroundColors = [
    Color(0xFFD3C4E9), // Ungu
    Color(0xFFF2C4B0), // Orange
    Color(0xFFCCAFA1), // Coklat
    Color(0xFFF0DB9A), // Kuning
    Color(0xFFCEE38C), // Hijau
  ];

  final List<String> moodTexts = [
    "Sangat Buruk",
    "Buruk",
    "Netral",
    "Bagus",
    "Sangat Bagus",
  ];

  final List<String> moodImages = [
    moodAnxious,
    moodSad,
    moodFlat,
    moodHappy,
    moodExcellent,
  ];

  final List<String> iconImages = [
    anxious,
    sad,
    flat,
    happy,
    excellent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          // PageView untuk mood selection
          PageView.builder(
            controller: _pageController,
            itemCount: backgroundColors.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Mood(
                icon: iconImages[index],
                image: moodImages[index],
                mood: moodTexts[index],
                color: backgroundColors[index],
              );
            },
          ),

          // Indicator PageView
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.18, // 18% dari tinggi layar
            child: SmoothPageIndicator(
              controller: _pageController,
              count: moodImages.length,
              effect: WormEffect(
                dotHeight: 12,
                dotWidth: 12,
                activeDotColor: Colors.white,
                dotColor: Colors.grey[300]!,
              ),
            ),
          ),

          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.08, // 8% dari tinggi layar
            left: 20,
            right: 20,
            child: Consumer<MoodDataProvider>(
              builder: (context, moodProvider, child) {
                return RoundedSubmitButton(
                  text: "Selanjutnya",
                  onPressed: () {
                    moodProvider.updateMood(iconImages[_currentIndex]);
                    Navigator.pushReplacementNamed(context, "/sleeptracker");
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Mood extends StatelessWidget {
  const Mood({
    super.key,
    required this.image,
    required this.mood,
    required this.color,
    required this.icon,
  });

  final String icon;
  final String image;
  final String mood;
  final Color color;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Bagaimana perasaan kamu hari ini?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: primaryBlack,
              ),
            ),
            SizedBox(height: screenHeight * 0.05), // 5% dari tinggi layar

            Image.asset(image, height: screenHeight * 0.2), // 20% dari tinggi layar
            SizedBox(height: screenHeight * 0.05), // 5% dari tinggi layar

            Text(
              mood,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: primaryBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RoundedSubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedSubmitButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        backgroundColor: Colors.white,
        foregroundColor: primary[90],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Rounded shape
        ),
        elevation: 0,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
