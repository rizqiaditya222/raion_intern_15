import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import '../../../../assets/color.dart';
import '../../provider/payment_provider.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String selectedValue = "option1";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Rincian Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 24),
          buildRowText("Konsultasi Online", "Rp100.000"),
          SizedBox(height: 24),
          buildRowText("Biaya Admin", "Rp5.000"),
          SizedBox(height: 24),
          Image.asset(line),
          SizedBox(height: 24),
          buildRowText("Total", "Rp105.000"),
          SizedBox(height: 24),
          Text("Metode Pembayaran",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          SizedBox(height: 24),
          Column(
            children: [
              buildRadioTile(context, "option1", "BCA", bca),
              buildRadioTile(context, "option2", "Dana", dana),
              buildRadioTile(context, "option3", "Gopay", gopay),
              buildRadioTile(context, "option4", "Mastercard", mastercard),
            ],
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget buildRowText(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(leftText, style: TextStyle(fontSize: 16)),
        Text(rightText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }

  Widget buildRadioTile(BuildContext context, String value, String text, String icon) {
    return Consumer<PaymentProvider>(
      builder: (context, paymentProvider, child) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: defaultLightSilver[100]!),
            borderRadius: BorderRadius.circular(8),
          ),
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Image.asset(icon),
            title: Text(text, style: const TextStyle(fontSize: 16)),
            trailing: Radio(
              value: value,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue as String;
                });
                paymentProvider.updatePaymentMethod(icon, text);
              },
            ),
          ),
        );
      },
    );
  }
}
