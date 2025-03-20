import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Privacy Policy',
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
              const SizedBox(
                height: 50,
              ),
              Text(
                "Terakhir diperbarui: 10 Maret 2025",
                style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "1. Informasi Pihak Ketiga",
                style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    "Jika Anda menggunakan metode masuk pihak ketiga (Google, Facebook, dll.), kami dapat menerima informasi dasar seperti nama dan alamat email sesuai dengan kebijakan privasi mereka.",
                    style: TextStyle(
                      color: primary[90],
                      fontFamily: "Nunito",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "2. Penyimpanan Data",
                style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    "Kami menyimpan data pengguna hanya selama diperlukan untuk tujuan yang dijelaskan dalam kebijakan ini. Jika Anda menghapus akun, data Anda akan dihapus atau dianonimkan dalam jangka waktu tertentu sesuai kebijakan retensi kami.",
                    style: TextStyle(
                      color: primary[90],
                      fontFamily: "Nunito",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "3. Perubahan Kebijakan Privasi",
                style: TextStyle(
                  color: primary[90],
                  fontSize: 18,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    "Kami dapat memperbarui Kebijakan Privasi ini dari waktu ke waktu. Jika ada perubahan signifikan, kami akan memberitahu pengguna melalui email atau dalam aplikasi.",
                    style: TextStyle(
                      color: primary[90],
                      fontFamily: "Nunito",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "4. Kontak",
                style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                children: [
                  Text(
                    "Jika ada pertanyaan atau keluhan terkait layanan Serenia, dapat menghubungi kami melalui:",
                    style: TextStyle(
                      color: primary[90],
                      fontFamily: "Nunito",
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Email: support@serenia.com",
                style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
