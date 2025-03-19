import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/features/presentation/provider/mood.provider.dart';

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

  final List<String> iconImages = [
    anxious,
    sad,
    flat, 
    happy, 
    excellent, 
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: backgroundColors.length,
      itemBuilder: (context, index) {
        return Mood(
          icon: iconImages[index],
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
    super.key, required this.image, required this.mood, required this.color, required this.icon,
  });

  final String icon;
  final String image;
  final String mood;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final moodProvider = Provider.of<MoodProvider>(context, listen: false);

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
                color: Colors.white, 
              ),
            ),
            Image.asset(image, height: 140),
            Text(
              mood,textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white, 
              ),
            ),
            SubmitButton(
              myText: "Set Mood", 
              onPressed: (){
                moodProvider.updateMood(icon);
              },
              fgColor: primary[90]!,
              bgColor: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
