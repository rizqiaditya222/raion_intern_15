import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

class PaymentProvider with ChangeNotifier {
  String _selectedPaymentImage = bca;
  String _selectedPaymentMethod = "BCA";

  String get selectedPaymentImage => _selectedPaymentImage;
  String get selectedPaymentMethod => _selectedPaymentMethod;

  void updatePaymentMethod(String newPaymentImage, String newPaymentMethod) {
    _selectedPaymentImage = newPaymentImage;
    _selectedPaymentMethod = newPaymentMethod;
    notifyListeners();
  }
}
