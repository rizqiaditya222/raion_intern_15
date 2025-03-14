import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  final double progress;
  final String message;
  final Color trackColor;
  final Color progressColor;
  final Color textColor;

  const LoadingIndicator({
    Key? key,
    this.progress = 0.1, // Default to 10%
    this.message = 'Tunggu sebentar ya!\nHasil mu sedang di proses',
    this.trackColor = const Color(0xFFF8E8A6),
    this.progressColor = const Color(0xFF3D5A80),
    this.textColor = const Color(0xFF1A2A3A),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(
          20), // Ensure container has transparent background
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: CircularProgressIndicator(
                  value: progress,
                  strokeWidth: 12,
                  backgroundColor: trackColor,
                  valueColor: AlwaysStoppedAnimation<Color>(progressColor),
                ),
              ),
              Text(
                '${(progress * 100).toInt()}%',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: textColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
