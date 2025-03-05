
import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class WelcomeSection extends StatelessWidget {
  WelcomeSection({
    super.key, required this.title, required this.subtitle, this.hPadding = 60});

  final String title;
  final String subtitle;
  double hPadding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          width: 200,
          child: Image(image: AssetImage(logo), fit: BoxFit.contain),
        ),
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: 30),
          child: Text(
            subtitle,
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
