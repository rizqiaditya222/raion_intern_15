import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/formField.dart';
import 'package:raion_intern_15/assets/widgets/dropdown.dart';
import 'package:raion_intern_15/features/presentation/provider/form_provider.dart';

class InformationForm extends StatelessWidget {
  const InformationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<InformationFormProvider>(context);

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Form(
        child: Column(
          children: [
            FormFieldWidget(
              controller: formProvider.nameController,
              obscureText: false,
              labelText: "Nama",
              hintText: "Nama Lengkap",
              icon: nameInfo,
            ),
            CustomDropdown(
              labelText: "Jenis Kelamin",
              options: ["Laki-laki", "Perempuan", "Lain-lain"],
              selectedValue: formProvider.selectedGender,
              onChanged: (value) => formProvider.setGender(value),
              iconPath: gender,
            ),
            CustomDropdown(
              labelText: "Konsultasi",
              options: ["Online", "Offline"],
              selectedValue: formProvider.selectedConsultation,
              onChanged: (value) => formProvider.setConsultation(value),
              iconPath: online,
            ),
            FormFieldWidget(
              controller: formProvider.heightController,
              obscureText: false,
              labelText: "Tinggi",
              hintText: "Tinggi Badan (cm)",
              icon: height,
            ),
            FormFieldWidget(
              controller: formProvider.weightController,
              obscureText: false,
              labelText: "Berat",
              hintText: "Berat Badan (kg)",
              icon: weight,
            ),
            FormFieldWidget(
              controller: formProvider.addressController,
              obscureText: false,
              labelText: "Alamat",
              hintText: "Alamat",
              icon: address,
            ),
          ],
        ),
      ),
    );
  }
}
