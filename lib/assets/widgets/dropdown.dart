import 'package:flutter/material.dart';

import '../color.dart';

class CustomDropdown extends StatefulWidget {
  final String labelText;
  final List<String> options;
  final String? selectedValue;
  final Function(String?) onChanged;
  final String iconPath;

  const CustomDropdown({
    Key? key,
    required this.labelText,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
    required this.iconPath,
  }) : super(key: key);

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          dropdownColor: Colors.white,
          value: widget.selectedValue,
          items: widget.options
              .map((option) => DropdownMenuItem(
            value: option,
            child: Text(option),
          ))
              .toList(),
          onChanged: widget.onChanged,
          decoration: InputDecoration(
            hintText: "Pilih ${widget.labelText}",
            hintStyle: TextStyle(color: defaultLightSilver[100]!),
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(
                widget.iconPath,
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
            contentPadding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
