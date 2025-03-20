import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class QuestionWidget extends StatefulWidget {
  final int index;
  final String question;
  final int? selectedOption;
  final ValueChanged<int?> onChanged;

  const QuestionWidget({
    super.key,
    required this.index,
    required this.question,
    required this.selectedOption,
    required this.onChanged,
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  int? selected;

  @override
  void initState() {
    super.initState();
    selected = widget.selectedOption;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.question,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: "Nunito",
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(5, (optionIndex) {
            double size;
            if (optionIndex == 2) {
              size = 30.0;
            } else if (optionIndex == 1 || optionIndex == 3) {
              size = 50.0;
            } else {
              size = 60.0;
            }

            return Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = optionIndex;
                    });
                    widget.onChanged(optionIndex);
                  },
                  child: Container(
                    width: size,
                    height: size,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color(0xFF193A63),
                        width: 1,
                      ),
                    ),
                    child: selected == optionIndex
                        ? Center(
                            child: Container(
                              width: size * 0.8,
                              height: size * 0.8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: primary[70],
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 10),
                if (optionIndex == 0)
                  const Text(
                    "Tidak pernah",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                if (optionIndex == 4)
                  const Text(
                    "Sangat sering",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
              ],
            );
          }),
        ),
      ],
    );
  }
}
