import 'package:flutter/material.dart';

class ArtikelMental extends StatefulWidget {
  const ArtikelMental({super.key});

  @override
  State<ArtikelMental> createState() => _ArtikelMentalState();
}

class _ArtikelMentalState extends State<ArtikelMental> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Artikel',
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w700 // Ubah jadi hitam agar lebih terlihat
              ),
        ),
        centerTitle: true, // Ini akan memastikan judul di tengah
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        titleSpacing: -5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Kesehatan mental sama pentingnya fisik',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Colors.grey[300], // Warna background abu-abu
                    radius: 20,
                    child: Icon(
                      Icons.person, // Icon profil default
                      size: 24, // Ukuran icon
                      color: Colors.grey[
                          700], // Warna icon lebih gelap agar terlihat jelas
                    ),
                  ),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sarah Sachan',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunito",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '4j',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontFamily: "Nunito",
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFFECF4FF), // Warna background biru
                    ),
                    child: const Text(
                      'Ikuti',
                      style: TextStyle(
                        color: Color(
                            0xFF193A63), // Ubah warna teks jadi putih agar kontras
                        fontFamily: "Nunito",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  'lib/assets/images/artikel/kesehatan_mental.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ilustrasi unsplash kesehatan mental',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontFamily: "Nunito",
                ),
              ),
              const SizedBox(height: 16),
              Wrap(
                children: const [
                  Text(
                    'Kesehatan mental dan fisik saling berkaitan erat. Banyak orang lebih fokus menjaga tubuh tetap sehat, tetapi mengabaikan kesehatan mental. Padahal, gangguan mental bisa mempengaruhi kondisi fisik, seperti menyebabkan kelelahan, gangguan tidur, atau menurunkan sistem imun.\n\n'
                    'Menjaga kesehatan mental bisa dilakukan dengan berbagai cara. Salah satunya adalah dengan menerapkan pola hidup sehat, seperti tidur cukup, berolahraga, dan mengonsumsi makanan bergizi. Selain itu, mengelola stres dengan baik dan memiliki dukungan sosial yang positif juga berperan besar dalam menjaga keseimbangan emosional.\n\n'
                    'Tanpa kesehatan mental yang baik, seseorang mungkin merasa sulit untuk beraktivitas secara optimal. Konsentrasi menurun, motivasi hilang, bahkan risiko penyakit fisik meningkat. Oleh karena itu, penting untuk memberikan perhatian yang sama terhadap kesehatan mental dan fisik agar dapat menjalani kehidupan yang lebih seimbang dan bahagia.\n\n'
                    'Jika merasa kewalahan atau mengalami stres berkepanjangan, jangan ragu untuk mencari bantuan profesional. Kesehatan mental bukan hal yang bisa diabaikan, karena ia sama pentingnya dengan kesehatan fisik.',
                    style: TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      fontFamily: "Nunito",
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'Komentar...',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.comment_outlined),
                      color: Colors.black54,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.black54,
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.share_sharp),
                      color: Colors.black54,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
