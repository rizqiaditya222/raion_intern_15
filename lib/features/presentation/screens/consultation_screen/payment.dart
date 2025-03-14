import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

import '../../../../assets/color.dart';

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
        padding: EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Rincian Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Konsultasi Online", style: TextStyle(fontSize: 16),),
                Text("Rp100.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ],
            ),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Biaya Admin", style: TextStyle( fontSize: 16),),
                Text("Rp5.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ],
            ),
            SizedBox(height: 24,),
            Image.asset(line),
            SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total", style: TextStyle(fontSize: 16),),
                Text("Rp105.000", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ],
            ),
            SizedBox(height: 24,),

            Text("Metode Pembayaran", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
            SizedBox(height: 24,),
            Column(
              children: [
                buildRadioTile("option1", "Mastercard", card),
                buildRadioTile("option2", "Mastercard", card),
                buildRadioTile("option3", "Mastercard", card),
                buildRadioTile("option4", "Mastercard", card),
              ],
            )
          ],
    ),
    );
  }

  Widget buildRadioTile(String value, String text, String icon) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: defaultLightSilver[100]!), // Border warna defaultLightSilver[100]
        borderRadius: BorderRadius.circular(8), // Radius agar lebih rapi
      ),
      margin: const EdgeInsets.symmetric(vertical: 4), // Jarak antar item
      child: ListTile(
        leading: Image.asset(icon), // Ikon di kiri
        title: Text(
          text,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (newValue) {
            setState(() {
              selectedValue = newValue as String;
            });
          },
        ),
      ),
    );
  }

}
