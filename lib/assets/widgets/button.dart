import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

  class SubmitButton extends StatelessWidget {
    const SubmitButton({
      super.key,
      required this.myText,
      required this.onPressed, // Tambahkan parameter onPressed
    });

    final String myText;
    final VoidCallback onPressed; // Tipe data VoidCallback (alias untuk Function())

    @override
    Widget build(BuildContext context) {
      return SizedBox(
        width: double.infinity,
        height: 56,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: primary[90],
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // Atur sesuai kebutuhan (0 untuk tanpa rounded)
    )
          ),
          onPressed: onPressed, // Gunakan onPressed sebagai event handler
          child: Text(myText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),),
        ),
      );
    }
  }

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key, required this.myText});

  final String myText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: OutlinedButton.icon(
        
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
          ),
          side: BorderSide(color: primary[90] ?? primary[90]!, width: 1),
          
        ),
        icon: Image(
          image: AssetImage(google,),
          width: 35,
          fit: BoxFit.contain,
        ),
        onPressed: () {},
        label: Text(myText, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
