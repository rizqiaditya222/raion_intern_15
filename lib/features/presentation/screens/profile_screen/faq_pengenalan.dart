import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class FaqPengenalan extends StatefulWidget {
  const FaqPengenalan({super.key});

  @override
  State<FaqPengenalan> createState() => _FaqPengenalanState();
}

class _FaqPengenalanState extends State<FaqPengenalan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Apa Itu Serenia?',
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
                    'Serenia adalah platform inovatif yang dirancang untuk membantu pengguna mengelola kesehatan mental dan kesejahteraan emosional melalui berbagai fitur seperti meditasi terpandu, pelacakan suasana hati, dan akses ke konten edukatif.',
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
