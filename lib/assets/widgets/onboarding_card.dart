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
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor,
      child: Stack(
        alignment: Alignment.center,
        children: _buildPositionedImages(),
      ),
    );
  }

  List<Widget> _buildPositionedImages() {
    List<Widget> positionedImages = [];

    for (int i = 0; i < images.length; i++) {
      if (i < imageConfigs.length) {
        ImagePositionConfig config = imageConfigs[i];
        positionedImages.add(
          Positioned(
            top: config.top,
            bottom: config.bottom,
            left: config.left,
            right: config.right,
            child: Image.asset(
              images[i],
              fit: config.fit ?? BoxFit.cover,
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
