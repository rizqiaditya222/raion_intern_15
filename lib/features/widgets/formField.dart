import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    this.inputType,
    required this.obscureText,
    required this.labelText,
    required this.icon,
    this.validator,
    this.controller, // Tambahkan controller
  });

  final TextInputType? inputType;
  final bool obscureText;
  final String labelText;
  final Icon icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller; // Tambahkan controller opsional

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller, // Gunakan controller jika ada
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            labelText: labelText,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: icon,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          validator: validator,
        ),
        SizedBox(height: 15),
      ],
    );
  }
}
