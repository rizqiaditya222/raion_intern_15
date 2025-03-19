import 'package:flutter/material.dart';

class InformationFormProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String? selectedGender;
  String? selectedConsultation;

  void setGender(String? gender) {
    selectedGender = gender;
    notifyListeners();
  }

  void setConsultation(String? consultation) {
    selectedConsultation = consultation;
    notifyListeners();
  }

  void resetForm() {
    nameController.clear();
    heightController.clear();
    weightController.clear();
    addressController.clear();
    selectedGender = null;
    selectedConsultation = null;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    heightController.dispose();
    weightController.dispose();
    addressController.dispose();
    super.dispose();
  }
}
