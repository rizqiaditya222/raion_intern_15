import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class Jurnalblank extends StatefulWidget {
  const Jurnalblank({super.key});

  @override
  State<Jurnalblank> createState() => _JurnalblankState();
}

class _JurnalblankState extends State<Jurnalblank> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding here
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/images/jurnal/therapy3.png"),
              SizedBox(height: 20),
              Text(
                "Mulai Jurnal Pertamamu!",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: "Nunito",
                  color: primary[90],
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Wrap(
                children: [
                  Text(
                    "Kamu belum pernah menulis jurnal di sini. Yuk, mulai sekarang! Menulis jurnal bisa membantumu merefleksikan hari, mengelola emosi, dan tetap produktif",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "Nunito",
                      color: primary[90],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/jurnalselect');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary[90],
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10), // Fixed borderRadius
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Buat Jurnal Baru",
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Nunito",
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.add,
                      size: 30,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
