import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/button_next_test.dart';
import 'package:raion_intern_15/assets/widgets/soal_test.dart';

class MentalHealthTest extends StatefulWidget {
  const MentalHealthTest({super.key});

  @override
  State<MentalHealthTest> createState() => _MentalHealthTestState();
}

class _MentalHealthTestState extends State<MentalHealthTest> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  // Data untuk semua kategori test
  final List<Map<String, dynamic>> _testCategories = [
    {
      "title": "Test Kesehatan Mental Positif",
      "questions": [
        "1. Saya selalu merasa bersyukur dalam hidup",
        "2. Saya dapat mengelola stres dengan baik",
        "3. Saya tetap merasa termotivasi dan optimis",
        "4. Saya memiliki kebiasaan sehat",
        "5. Saya secara rutin mengekspresikan rasa syukur",
        "6. Saya mampu menjaga keseimbangan",
      ],
      "selectedOptions": List.generate(6, (_) => null),
    },
    {
      "title": "Test Kesehatan Mental Negatif",
      "questions": [
        "1. Saya sering merasa lelah tanpa alasan",
        "2. Saya sering merasa cemas atau gelisah",
        "3. Saya sering mengalami kesulitan tidur",
        "4. Saya sulit berkonsentrasi dalam aktivitas",
        "5. Saya merasa tidak punya motivasi",
        "6. Saya sering merasa tidak berharga",
      ],
      "selectedOptions": List.generate(6, (_) => null),
    },
    {
      "title": "Test Kesehatan Gaya Hidup",
      "questions": [
        "1. Saya rutin berolahraga setiap harinya",
        "2. Saya mengonsumsi makanan sehat dan bergizi",
        "3. Saya mengatur waktu kerja dengan baik",
        "4. Saya tidur cukup selama 7-9 jam setiap malam",
        "5. Saya meluangkan waktu untuk bersantai",
      ],
      "selectedOptions": List.generate(5, (_) => null),
    },
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < _testCategories.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _testCategories[_currentPage]["title"],
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Nunito",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: _previousPage,
        ),
        backgroundColor: primary[90],
        elevation: 2,
        toolbarHeight: 80,
        titleSpacing: -5,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                physics:
                    const NeverScrollableScrollPhysics(), // Disable swipe to ensure user answers questions
                itemCount: _testCategories.length,
                itemBuilder: (context, categoryIndex) {
                  final category = _testCategories[categoryIndex];
                  final questions = category["questions"] as List<String>;
                  final selectedOptions =
                      category["selectedOptions"] as List<int?>;

                  return ListView.builder(
                    padding: const EdgeInsets.all(24.0),
                    itemCount: questions.length,
                    itemBuilder: (context, questionIndex) {
                      return Column(
                        children: [
                          SizedBox(height: questionIndex == 0 ? 0 : 18),
                          QuestionWidget(
                            index: questionIndex,
                            question: questions[questionIndex],
                            selectedOption: selectedOptions[questionIndex],
                            onChanged: (value) {
                              setState(() {
                                selectedOptions[questionIndex] = value;
                              });
                            },
                          ),
                          const SizedBox(height: 30),
                        ],
                      );
                    },
                  );
                },
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: SubmitButtonWidget(
                onPressed: () {
                  _nextPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
