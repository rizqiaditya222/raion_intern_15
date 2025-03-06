import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/onboarding_card.dart';

class Onboardingpage extends StatefulWidget {
  const Onboardingpage({super.key});

  @override
  State<Onboardingpage> createState() => _OnboardingpageState();
}

class _OnboardingpageState extends State<Onboardingpage> {
  static final PageController _pageController = PageController(initialPage: 0);

  final List<Map<String, dynamic>> _onBoardingData = [
    {
      "images": [
        "lib/assets/images/onBoard1/vector.png",
        "lib/assets/images/onBoard1/Anxiety 1.png",
        "lib/assets/images/onBoard1/Frame.png",
        "lib/assets/images/onBoard1/Frame-1.png",
        "lib/assets/images/onBoard1/Frame-2.png"
      ],
      "color": Color(0xFFF9C83A),
      "text":
          "Lacak suasana hatimu dan temukan pola emosi untuk hidup lebih seimbang",
      "imageConfigs": [
        ImagePositionConfig(bottom: 1),
        ImagePositionConfig(top: 145),
        ImagePositionConfig(top: 300, right: 50),
        ImagePositionConfig(top: 150, right: 70),
        ImagePositionConfig(bottom: 200, left: 20),
      ]
    },
    {
      "images": [
        "lib/assets/images/onBoard2/vector.png",
        "lib/assets/images/onBoard2/Therapy Session 1.png",
        "lib/assets/images/onBoard2/vector-1.png",
        "lib/assets/images/onBoard2/vector-2.png",
      ],
      "color": Color.fromARGB(255, 246, 103, 241),
      "text":
          "Dapatkan dukungan profesional melalui sesi konsultasi bersama spesialis",
      "imageConfigs": [
        ImagePositionConfig(top: 100),
        ImagePositionConfig(
          bottom: 1,
          right: 1,
          left: 1,
          top: 1,
        ),
        ImagePositionConfig(top: 80, left: 100),
        ImagePositionConfig(top: 140, left: 180),
      ]
    },
    {
      "images": [
        "lib/assets/images/onBoard3/Deep Breathing 1.png",
        "lib/assets/images/onBoard3/Vector.png",
        "lib/assets/images/onBoard3/Vector-3.png",
        "lib/assets/images/onBoard3/Vector-2.png",
        "lib/assets/images/onBoard3/Vector-1.png",
        "lib/assets/images/onBoard3/Vector-4.png",
      ],
      "color": Color.fromRGBO(138, 224, 255, 0.878),
      "text":
          "Temukan ketenangan, redakan stres, dan tingkatkan fokus dengan meditasi",
      "imageConfigs": [
        ImagePositionConfig(
          top: 100,
        ),
        ImagePositionConfig(bottom: 100, left: 1),
        ImagePositionConfig(bottom: 50, right: 1),
        ImagePositionConfig(top: 60, left: 1),
        ImagePositionConfig(top: 180, right: 1),
        ImagePositionConfig(top: 1),
      ]
    },
  ];

  Color _backgroundColor = Color(0xFFF9C83A);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int pageIndex = _pageController.page?.round() ?? 0;
      if (pageIndex != _currentPage) {
        setState(() {
          _currentPage = pageIndex;
          _backgroundColor = _onBoardingData[pageIndex]["color"];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onBoardingData.length,
                  itemBuilder: (context, index) => OnboardingCard(
                    images: _onBoardingData[index]["images"],
                    backgroundColor: _onBoardingData[index]["color"],
                    imageConfigs: _onBoardingData[index]["imageConfigs"],
                  ),
                ),
              ),
              _buildBottomOnBoarding(),
            ],
          ),

          // Conditional Back Button
          if (_currentPage >= 1)
            Positioned(
              top: 50,
              left: 20,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.black,
                    size: 24,
                  ),
                  onPressed: () {
                    if (_currentPage > 0) {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Widget Bottom OnBoarding
  Widget _buildBottomOnBoarding() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: LinearProgressIndicator(
              value: (_currentPage + 1) / _onBoardingData.length, // Progress
              backgroundColor: Colors.grey.shade300,
              color: Colors.lightBlue,
              minHeight: 6,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(height: 12),
          Text(
            _onBoardingData[_currentPage]["text"],
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              fontFamily: 'Nunito',
              fontWeight: FontWeight.bold,
              color: primary[90],
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primary[90],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (_currentPage < _onBoardingData.length - 1) {
                  _pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                } else {
                  Navigator.pushReplacementNamed(context, '/registerPatient');
                }
              },
              child: Text(
                _currentPage < _onBoardingData.length - 1
                    ? "Selanjutnya"
                    : "Mulai Sekarang",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
