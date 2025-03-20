import 'package:flutter/material.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SizedBox.expand(
          child: Image.asset(
            'lib/assets/images/meditasi/video_image/konten_video.png',
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
