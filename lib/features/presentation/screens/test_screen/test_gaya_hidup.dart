import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/button_next_test.dart';
import 'package:raion_intern_15/assets/widgets/soal_test.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/loading_screen.dart';

class TestGayaHidup extends StatefulWidget {
  const TestGayaHidup({super.key});

  @override
  State<TestGayaHidup> createState() => _TestGayaHidupState();
}

class _TestGayaHidupState extends State<TestGayaHidup> {
  final String _testTitle = "Test Kesehatan Gaya Hidup";

  final List<String> _questions = [
    "1. Saya rutin berolahraga setiap harinya",
    "2. Saya mengonsumsi makanan sehat dan bergizi",
    "3. Saya mengatur waktu kerja dengan baik",
    "4. Saya tidur cukup selama 7-9 jam setiap malam",
    "5. Saya meluangkan waktu untuk bersantai",
  ];

  final List<int?> _selectedOptions = List.generate(5, (_) => null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _testTitle,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: "Nunito",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: primary[90],
        elevation: 2,
        toolbarHeight: 80,
        titleSpacing: -5,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(24.0),
          itemCount: _questions.length + 1, // Add one for the submit button
          itemBuilder: (context, questionIndex) {
            if (questionIndex == _questions.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: SubmitButtonWidget(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoadingScreen(nextRoute: '/hasilhidup'),
                      ),
                    );
                  },
                ),
              );
            }

            return Column(
              children: [
                SizedBox(height: questionIndex == 0 ? 0 : 18),
                QuestionWidget(
                  index: questionIndex,
                  question: _questions[questionIndex],
                  selectedOption: _selectedOptions[questionIndex],
                  onChanged: (value) {
                    setState(() {
                      _selectedOptions[questionIndex] = value;
                    });
                  },
                ),
                const SizedBox(height: 30),
              ],
            );
          },
        ),
      ),
    );
  }
}
