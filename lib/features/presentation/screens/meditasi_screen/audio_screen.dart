import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox.expand(
          child: Image.asset(
            'lib/assets/images/meditasi/audio_image/audio_screen.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
