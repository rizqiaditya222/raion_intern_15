import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/artikel_card.dart';

class ListArtikel extends StatefulWidget {
  const ListArtikel({super.key});

  @override
  State<ListArtikel> createState() => _ListArtikelState();
}

class _ListArtikelState extends State<ListArtikel> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Artikel',
          style: TextStyle(
            color: Colors.white,
            fontFamily: "Nunito",
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primary[90],
        elevation: 2,
        toolbarHeight: 80,
        titleSpacing: -5,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: const Color(0xFF193A63), width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Bipolar',
                        suffixIcon: Icon(Icons.search, color: primary[90]),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    // Artikel pertama dengan GestureDetector
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/artikelbipolar',
                        );
                      },
                      child: ArticleCard(
                        title:
                            'Apa Itu Gangguan Bipolar? Memahami Penyakit dan Jenis-jenisnya',
                        imagePath: 'lib/assets/images/artikel/bipolar.png',
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Artikel lainnya tetap menggunakan ArticleCard biasa
                    ArticleCard(
                      title:
                          'Gejala Bipolar: Mengenali Perubahan Mood yang Ekstrem',
                      imagePath: 'lib/assets/images/artikel/bipolar2.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Penyebab Gangguan Bipolar: Faktor Genetik, Lingkungan, dan Biologis',
                      imagePath: 'lib/assets/images/artikel/bipolar3.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Bipolar vs. Mood Swings: Bagaimana Membedakannya?',
                      imagePath: 'lib/assets/images/artikel/bipolar4.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Dampak Gangguan Bipolar dalam Kehidupan Sehari-hari',
                      imagePath: 'lib/assets/images/artikel/bipolar5.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Bipolar dalam Hubungan Sosial: Tantangan dan Cara Menghadapinya',
                      imagePath: 'lib/assets/images/artikel/bipolar6.png',
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
