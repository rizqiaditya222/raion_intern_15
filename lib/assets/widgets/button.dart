import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

import '../../features/presentation/provider/auth_provider.dart';

  class SubmitButton extends StatelessWidget {
  SubmitButton({
    super.key,
    required this.myText,
    required this.onPressed,
    this.bgColor, 
    this.fgColor = Colors.white, 
  });

  final String myText;
  final VoidCallback onPressed;
  final Color? bgColor; 
  final Color fgColor; 


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: bgColor ?? primary[90], 
          foregroundColor: fgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          myText,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
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
        onPressed: () {
          Provider.of<AuthProvider>(context, listen: false).signInWithGoogle(context);
        },
        label: Text(myText, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600)),
      ),
    );
  }
}
