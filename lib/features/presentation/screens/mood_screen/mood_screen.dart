import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';

class MoodScreen extends StatelessWidget {
   MoodScreen({super.key});

  final List<Color> backgroundColors = [
    Color(0xFF9260D1), // Ungu
    Color(0xFFFF8542), // Orange
    Color(0xFF8C5B41), // Coklat
    Color(0xFFF5D26A), // Kuning
    Color(0xFF96A05A), // Hijau
  ];

  final List<String> moodTexts = [
    "Aku merasa Sangat Cemas",
    "Aku merasa sedih",
    "Aku tidak merasakan apapun",
    "Aku senang",
    "Aku sangat bahagia",
  ];

  final List<String> moodImages = [
    moodAnxious,
    moodSad,
    moodFlat, 
    moodHappy, 
    moodExcellent, 
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: backgroundColors.length,
      itemBuilder: (context, index) {
        return Mood(
          image: moodImages[index],
          mood: moodTexts[index],
          color: backgroundColors[index],
        );
      },
    );
  }
}

class Mood extends StatelessWidget {
  const Mood({
    super.key, required this.image, required this.mood, required this.color,
  });

  final String image;
  final String mood;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Bagaimana perasaan kamu hari ini?",textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, // Warna teks putih
              ),
            ),
            Image.asset(image, height: 140),
            Text(
              mood,textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, // Warna teks putih
              ),
            ),
            SubmitButton(
              myText: "Set Mood", 
              onPressed: (){},
              fgColor: primary[90]!,
              bgColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
