import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class FormFieldWidget extends StatelessWidget {
  const FormFieldWidget({
    super.key,
    this.inputType,
    required this.obscureText,
    required this.labelText,
    required this.hintText,
    required this.icon,
    this.validator,
    this.controller,
    this.sizedBoxHeight = 15, // Parameter opsional dengan default value 20
  });

  final TextInputType? inputType;
  final bool obscureText;
  final String labelText;
  final String hintText;
  final String icon;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final double sizedBoxHeight; // Tambahkan parameter height opsional

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            labelText,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: inputType,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText, // Perbaikan hintText agar sesuai parameter
            hintStyle: TextStyle(color: defaultLightSilver[100]!), // Perbaikan hintText agar sesuai parameter
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                icon,
          width: 25,
          fit: BoxFit.contain,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: defaultLightSilver[100]!,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: primary[90]!,
                width: 2.5,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          ),
          validator: validator,
        ),
        SizedBox(height: sizedBoxHeight),
      ],
    );
  }
}
