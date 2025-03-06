import 'package:flutter/material.dart';

class OnboardingCard extends StatelessWidget {
  final List<String> images;
  final Color backgroundColor;
  final List<ImagePositionConfig> imageConfigs;

  const OnboardingCard({
    Key? key,
    required this.images,
    required this.backgroundColor,
    required this.imageConfigs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight,
      width: screenWidth,
      color: backgroundColor,
      child: Stack(
        children: _buildPositionedImages(screenWidth, screenHeight),
      ),
    );
  }

  List<Widget> _buildPositionedImages(double screenWidth, double screenHeight) {
    List<Widget> positionedImages = [];

    for (int i = 0; i < images.length; i++) {
      if (i < imageConfigs.length) {
        ImagePositionConfig config = imageConfigs[i];

        positionedImages.add(
          Positioned.fill(
            left: config
                .left, // Jika null, biarkan null agar tidak mengganggu posisi
            top: config.top,
            right: config.right,
            bottom: config.bottom,
            child: Align(
              alignment: Alignment.center, // Posisikan ke tengah
              child: Image.asset(
                images[i],
                width: screenWidth,
                height: screenHeight,
                fit: config.fit ?? BoxFit.fitWidth,
              ),
            ),
          ),
        );
      }
    }

    return positionedImages;
  }
}

class ImagePositionConfig {
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;
  final BoxFit? fit;

  const ImagePositionConfig({
    this.top,
    this.bottom,
    this.left,
    this.right,
    this.fit = BoxFit.cover,
  });
}
