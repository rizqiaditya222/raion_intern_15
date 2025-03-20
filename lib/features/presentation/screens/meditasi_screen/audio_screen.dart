import 'package:flutter/material.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  bool isPlaying = false;
  double currentPosition = 0.3; // Current position in the track (0.0 to 1.0)
  String currentTime = "0:23"; // Current time display

  void togglePlayPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          GestureDetector(
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

          // Close button
          Positioned(
            top: 30, // Increased from 10 to 30
            right: 10,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // Title and subtitle
          Positioned(
            top: 40, // Increased from 20 to 40
            left: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Relaksasi Diri',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '10 menit bersama Jennie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          // Positioned higher up on the screen
          Positioned(
            bottom: 100, // Moved higher up from the bottom
            left: 0,
            right: 0,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      trackHeight: 2,
                      thumbShape:
                          const RoundSliderThumbShape(enabledThumbRadius: 6),
                      overlayShape:
                          const RoundSliderOverlayShape(overlayRadius: 14),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white.withOpacity(0.3),
                      thumbColor: Colors.white,
                    ),
                    child: Slider(
                      value: 0.3,
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.replay_10,
                          color: Colors.white, size: 30),
                      onPressed: () {},
                    ),

                    // Play/Pause button
                    IconButton(
                      icon: Icon(
                        isPlaying
                            ? Icons.pause_circle_filled
                            : Icons.play_circle_filled,
                        color: Colors.white,
                        size: 50,
                      ),
                      onPressed: togglePlayPause,
                    ),

                    IconButton(
                      icon: const Icon(Icons.forward_10,
                          color: Colors.white, size: 30),
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
