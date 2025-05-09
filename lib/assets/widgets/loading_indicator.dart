import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  final double progress;
  final String message;
  final Color trackColor;
  final Color progressColor;
  final Color textColor;

  const LoadingIndicator({
    Key? key,
    this.progress = 1, // Default to 100%
    this.message = 'Tunggu sebentar ya!\nHasil mu sedang di proses',
    this.trackColor = const Color(0xFFF8E8A6),
    this.progressColor = const Color(0xFF3D5A80),
    this.textColor = const Color(0xFF1A2A3A),
  }) : super(key: key);

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  double animatedProgress = 0.0;
  bool showCheckmark = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up animation controller for the check mark appearance
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.elasticOut,
    );

    // Start progress animation after a short delay
    Future.delayed(const Duration(milliseconds: 300), () {
      setState(() {
        animatedProgress = widget.progress;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 180,
                height: 180,
                child: TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: animatedProgress),
                  duration:
                      const Duration(seconds: 1), // Durasi animasi 1 detik
                  curve: Curves.easeInOut, // Gunakan kurva animasi yang halus
                  builder: (context, value, child) {
                    // When progress reaches 100%, show checkmark
                    if (value >= 1.0 && !showCheckmark) {
                      Future.delayed(const Duration(milliseconds: 200), () {
                        if (mounted) {
                          setState(() {
                            showCheckmark = true;
                          });
                          _controller.forward();
                        }
                      });
                    }

                    return Transform.rotate(
                      angle: -3.14, // Rotasi -90° agar mulai dari bawah
                      child: CircularProgressIndicator(
                        value:
                            value, // Animasi berjalan dari 0 hingga nilai target
                        strokeWidth: 12,
                        backgroundColor: widget.trackColor,
                        valueColor:
                            AlwaysStoppedAnimation<Color>(widget.progressColor),
                      ),
                    );
                  },
                ),
              ),

              // Show either percentage or checkmark
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: showCheckmark
                    ? ScaleTransition(
                        scale: _scaleAnimation,
                        child: Image.asset(
                          'lib/assets/images/loading/check.png',
                          width: 80,
                          height: 80,
                          key: const ValueKey('checkmark'),
                        ),
                      )
                    : Text(
                        '${(animatedProgress * 100).toInt()}%',
                        key: ValueKey<int>((animatedProgress * 100).toInt()),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: widget.textColor,
                        ),
                      ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            showCheckmark ? widget.message : widget.message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: widget.textColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
