import 'package:flutter/material.dart';

class Dummy extends StatelessWidget {
  const Dummy({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
  padding: const EdgeInsets.all(16.0),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Name: ", style: TextStyle(fontSize: 18)),
      Text("Email:", style: TextStyle(fontSize: 16)),
      Text("Bio: ", style: TextStyle(fontSize: 14)),
    ],
  ),
);

  }
}