import 'package:flutter/material.dart';

class ArtikelBipolar extends StatefulWidget {
  const ArtikelBipolar({super.key});

  @override
  State<ArtikelBipolar> createState() => _ArtikelBipolarState();
}

class _ArtikelBipolarState extends State<ArtikelBipolar> {
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
                'Apa Itu Gangguan Bipolar? Memahami Penyakit dan Jenis-jenisnya',
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
                        'Raymond Chin',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: "Nunito",
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '9j',
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
                  'lib/assets/images/artikel/bipolar.png',
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Ilustrasi unsplash bipolar',
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
                    'Jenis-jenis Gangguan Bipolar\n\n'
                    '1. Bipolar I\n'
                    'Bipolar I ditandai dengan episode mania yang berlangsung setidaknya selama 7 hari atau lebih, atau mania yang begitu parah hingga memerlukan perawatan di rumah sakit. Episode depresi juga dapat terjadi, biasanya berlangsung selama dua minggu atau lebih.\n\n'
                    'Ciri-ciri episode mania pada Bipolar I:\n'
                    '• Energi berlebihan, sulit tidur\n'
                    '• Berbicara sangat cepat dan sulit dihentikan\n'
                    '• Merasa sangat percaya diri, bahkan sampai merasa hebat atau memiliki kekuatan khusus\n'
                    '• Melakukan tindakan impulsif tanpa memikirkan konsekuensinya, seperti belanja berlebihan atau mengambil risiko berbahaya\n\n'
                    '2. Bipolar II\n'
                    'Bipolar II ditandai dengan episode depresi yang lebih berat dan episode hipomania, yaitu bentuk mania yang lebih ringan. Berbeda dengan Bipolar I, hipomania pada Bipolar II tidak sampai menyebabkan gangguan besar dalam kehidupan sehari-hari atau membutuhkan rawat inap.\n\n'
                    'Ciri-ciri episode hipomania:\n'
                    '• Merasa lebih berenergi dan produktif daripada biasanya\n'
                    '• Tidak sampai kehilangan kendali atau mengalami delusi\n'
                    '• Masih dapat berfungsi dalam kehidupan sehari-hari\n\n'
                    'Namun, episode depresi pada Bipolar II cenderung lebih parah dibandingkan dengan Bipolar I.\n\n'
                    '3. Cyclothymic Disorder (Gangguan Siklotimia)\n'
                    'Gangguan siklotimia adalah bentuk bipolar yang lebih ringan, dengan periode hipomania dan depresi yang lebih sering terjadi tetapi tidak seberat Bipolar I atau II. Perubahan suasana hati ini terjadi selama minimal dua tahun (satu tahun pada anak-anak dan remaja).\n\n'
                    'Orang dengan siklotimia mungkin tampak memiliki perubahan suasana hati yang cepat, tetapi tidak cukup parah untuk didiagnosis sebagai Bipolar I atau II.',
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
