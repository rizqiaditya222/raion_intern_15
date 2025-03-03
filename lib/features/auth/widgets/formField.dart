import 'package:flutter/material.dart';
import 'package:raion_intern_15/features/auth/widgets/button.dart';

class formField extends StatelessWidget {
  const formField({
    super.key,
    this.inputType,
    required this.obscureText,
    required this.labelText,
    required this.icon,
    this.validator,
  });

  final TextInputType? inputType;
  final bool obscureText;
  final String labelText;
  final Icon icon;
  final String? Function(String?)? validator; // Validator sebagai parameter opsional

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20), // Mengatur posisi ikon
              child: icon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          validator: validator, // Gunakan validator yang dilempar dari parameter
        ),
        SizedBox(height: 15),

      ],
    );
  }
}
