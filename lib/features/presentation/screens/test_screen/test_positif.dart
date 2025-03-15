import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/button_next_test.dart';
import 'package:raion_intern_15/assets/widgets/soal_test.dart';
import 'package:raion_intern_15/features/presentation/screens/test_screen/loading_screen.dart';

class TestPositif extends StatefulWidget {
  const TestPositif({super.key});

  @override
  State<TestPositif> createState() => _TestPositifState();
}

class _TestPositifState extends State<TestPositif> {
  final String _testTitle = "Test Kesehatan Mental Positif";

  final List<String> _questions = [
    "1. Saya selalu merasa bersyukur dalam hidup",
    "2. Saya dapat mengelola stres dengan baik",
    "3. Saya tetap merasa termotivasi dan optimis",
    "4. Saya memiliki kebiasaan sehat",
    "5. Saya secara rutin mengekspresikan rasa syukur",
    "6. Saya mampu menjaga keseimbangan",
  ];

  final List<int?> _selectedOptions = List.generate(6, (_) => null);

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
          itemBuilder: (context, index) {
            if (index == _questions.length) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 24.0, vertical: 16.0),
                child: SubmitButtonWidget(
                  onPressed: () {
                    // Navigate to the next test page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            const LoadingScreen(nextRoute: '/hasilpositif'),
                      ),
                    );
                  },
                ),
              );
            }

            return Column(
              children: [
                SizedBox(height: index == 0 ? 0 : 18),
                QuestionWidget(
                  index: index,
                  question: _questions[index],
                  selectedOption: _selectedOptions[index],
                  onChanged: (value) {
                    setState(() {
                      _selectedOptions[index] = value;
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
