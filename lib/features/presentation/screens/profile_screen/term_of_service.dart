import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class TermOfService extends StatefulWidget {
  const TermOfService({super.key});

  @override
  State<TermOfService> createState() => _TermOfServiceState();
}

class _TermOfServiceState extends State<TermOfService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Term of Service',
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
                "1. Penerimaan Ketentuan",
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
                    "Dengan mengunduh, mengakses, atau menggunakan aplikasi Serenia, Anda menyetujui untuk terikat dengan Syarat dan Ketentuan ini. Jika Anda tidak setuju dengan ketentuan ini, mohon untuk tidak menggunakan aplikasi.",
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
                "2. Layanan yang Disediakan",
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
                    "Serenia adalah aplikasi kesehatan mental yang menyediakan fitur seperti test kesehatan mental, jurnal refleksi, pemantauan suasana hati, dan konsultasi dengan profesional kesehatan mental. Aplikasi ini bukan pengganti layanan medis dan tidak dapat digunakan untuk diagnosis atau pengobatan penyakit mental.",
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
                "3. Pendaftaran Akun Pengguna",
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
                    "Harus berusia minimal 17 tahun atau memiliki izin dari orang tua/wali untuk menggunakan Serenia. Pengguna bertanggung jawab menjaga keamanan informasi akun, termasuk kata sandi. Serenia berhak menangguhkan atau menutup akun jika ditemukan pelanggaran terhadap ketentuan ini.",
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
    ;
  }
}
