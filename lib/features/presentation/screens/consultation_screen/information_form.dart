import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/formField.dart';

import '../../../../assets/widgets/dropdown.dart';

class InformationForm extends StatefulWidget {
  const InformationForm({super.key});

  @override
  State<InformationForm> createState() => _InformationFormState();
}

class _InformationFormState extends State<InformationForm> {
  String? selectedGender;

  String? selectedConsultation;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
    child: Form(
        child: Column(
          children: [
            FormFieldWidget(
                obscureText: false,
                labelText: "Nama",
                hintText: "Nama Lengkap",
                icon: nameInfo),
            CustomDropdown(
              labelText: "Jenis Kelamin",
              options: ["Laki-laki", "Perempuan", "Lain-lain"],
              selectedValue: selectedGender,
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              iconPath: gender,
            ),
            CustomDropdown(
              labelText: "Konsultasi",
              options: ["Online", "Offline"],
              selectedValue: selectedConsultation,
              onChanged: (value) {
                setState(() {
                  selectedConsultation = value;
                });
              },
              iconPath: online,
            ),
            FormFieldWidget(
                obscureText: false,
                labelText: "Tinggi",
                hintText: "Tinggi Badan (cm)",
                icon: height),
            FormFieldWidget(
                obscureText: false,
                labelText: "Berat",
                hintText: "Berat Badan (cm)",
                icon: weight),
            FormFieldWidget(
                obscureText: false,
                labelText: "Alamat",
                hintText: "Alamat",
                icon: address),
          ],
        ))
    );
  }
}