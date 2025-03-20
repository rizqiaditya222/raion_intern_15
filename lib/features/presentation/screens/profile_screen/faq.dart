import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class Faq extends StatefulWidget {
  const Faq({super.key});

  @override
  State<Faq> createState() => _FaqState();
}

class _FaqState extends State<Faq> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'FAQ',
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
                children: [
                  const SizedBox(height: 50),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/faqpengenalan');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Apa itu Serenia?',
                          style: TextStyle(
                            color: primary[90],
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: primary[90],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/faqbagaimana');
                    },
                    child: Row(
                      children: [
                        Text(
                          'Bagaimana Serenia bekerja?',
                          style: TextStyle(
                            color: primary[90],
                            fontSize: 16,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: primary[90],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/faqpayment');
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Wrap(
                            children: [
                              Text(
                                'Apakah Serenia dapat digunakan secara gratis?',
                                style: TextStyle(
                                  color: primary[90],
                                  fontSize: 16,
                                  fontFamily: "Nunito",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 30,
                          color: primary[90],
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