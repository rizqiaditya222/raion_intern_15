import 'package:flutter/material.dart';

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
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
          ),
          onPressed: onPressed, // Gunakan onPressed sebagai event handler
          child: Text(myText),
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
      height: 50,
      child: OutlinedButton.icon(
        icon: Image(
          image: AssetImage('assets/images/google_icon.png'),
          width: 20,
        ),
        onPressed: () {},
        label: Text(myText),
      ),
    );
  }
}
