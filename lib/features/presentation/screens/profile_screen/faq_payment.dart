import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class FaqPayment extends StatefulWidget {
  const FaqPayment({super.key});

  @override
  State<FaqPayment> createState() => _FaqPaymentState();
}

class _FaqPaymentState extends State<FaqPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bagaimana Serenia bekerja?',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w700 // Ubah jadi hitam agar lebih terlihat
              ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primary[90], // Ganti dari transparent ke putih
        elevation: 2, // Beri sedikit bayangan agar lebih terlihat
        toolbarHeight: 80, // Atur tinggi AppBar
        titleSpacing: -5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              SizedBox(
                height: 50,
              ),
              Wrap(
                children: [
                  Text(
                    'Serenia bekerja dengan menyediakan berbagai alat dan sumber daya yang membantu pengguna memahami serta mengelola emosi mereka. Pengguna dapat mengikuti sesi meditasi, menjawab kuisioner kesehatan mental, mencatat suasana hati, serta mendapatkan rekomendasi berbasis kecerdasan buatan untuk meningkatkan kesejahteraan mereka.',
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
