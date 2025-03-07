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
        "lib/assets/images/onBoard1.png",
      ],
      "color": Color(0xFFF9C83A),
      "text":
          "Lacak suasana hatimu dan temukan pola emosi untuk hidup lebih seimbang",
      "imageConfigs": [
        ImagePositionConfig(
          top: null,
          bottom: null,
          left: null,
          right: null,
          fit: BoxFit.fitHeight,
        ),
      ]
    },
    {
      "images": ["lib/assets/images/onBoard2.png"],
      "color": Color(0xFFCA1F97),
      "text":
          "Dapatkan dukungan profesional melalui sesi konsultasi bersama spesialis",
      "imageConfigs": [
        ImagePositionConfig(
          top: null,
          bottom: null,
          left: null,
          right: null,
          fit: BoxFit.fitHeight,
        ),
      ]
    },
    {
      "images": ["lib/assets/images/onBoard3.png"],
      "color": Color(0xFF1F9CCA),
      "text":
          "Temukan ketenangan, redakan stres, dan tingkatkan fokus dengan meditasi",
      "imageConfigs": [
        ImagePositionConfig(
          top: null,
          bottom: 50,
          left: 10,
          right: null,
          fit: BoxFit.contain, // Membuat gambar lebih kecil
        ),
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
            ],
          ),

          // Gambar Bottom Widget
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              height: 600,
              child: Image.asset(
                "lib/assets/images/bottomWidget.png",
                width: double.infinity,
                height: double.infinity, // Pastikan tetap sama
                fit: BoxFit.fill,
              ),
            ),
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

          // Konten Bottom OnBoarding (agar berada di atas gambar)
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _buildBottomOnBoarding(),
          ),
        ],
      ),
    );
  }

  /// Widget Bottom OnBoarding
  Widget _buildBottomOnBoarding() {
    return IntrinsicHeight(
      // Menyesuaikan tinggi dengan elemen tertinggi
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Agar mengikuti ukuran kontennya
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: LinearProgressIndicator(
                  value: (_currentPage + 1) / _onBoardingData.length,
                  backgroundColor: Colors.grey.shade300,
                  color: secondaryYellow[50],
                  minHeight: 6,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                _onBoardingData[_currentPage]["text"],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Nunito',
                  fontWeight: FontWeight.bold,
                  color: primary[90],
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 48, // Tinggi tombol sebagai batas bawah
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
      ),
    );
  }
}
