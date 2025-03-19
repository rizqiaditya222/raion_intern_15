import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/artikel_card.dart';

class ArtikelScreen extends StatefulWidget {
  const ArtikelScreen({super.key});

  @override
  State<ArtikelScreen> createState() => _ArtikelScreenState();
}

class _ArtikelScreenState extends State<ArtikelScreen> {
  // Controller for the search text field
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed
    _searchController.dispose();
    super.dispose();
  }

  // Menambahkan GestureDetector agar kartu bisa diklik
  Widget _buildHorizontalArticleCard({
    required String title,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/artikelmental');
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                imagePath,
                height: 120,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 40, // Fixed height untuk menghindari overflow
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Nunito",
                  color: Color(0xFF193A63),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  "Mozaik",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.chat_bubble_outline,
                  size: 14,
                  color: Colors.grey.shade500,
                ),
                const SizedBox(width: 4),
                Text(
                  "28",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  "12h",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const Spacer(),
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey.shade500,
                  size: 18,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Artikel',
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
                    border: Border.all(color: Color(0xFF193A63), width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Cari tau terkait kesehatan mental, yuk!',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.search, color: primary[90]),
                          onPressed: () {
                            // Navigate to artikelbipolar when search icon is pressed
                            if (_searchController.text.isNotEmpty) {
                              Navigator.pushNamed(context, '/listartikel');
                            }
                          },
                        ),
                        border: InputBorder.none,
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onSubmitted: (value) {
                        // Navigate to artikelbipolar when Enter/Return is pressed
                        if (value.isNotEmpty) {
                          Navigator.pushNamed(context, '/listartikel');
                        }
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Populer',
                  style: TextStyle(
                    fontSize: 16,
                    color: primary[90],
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200, // Increased height to accommodate the metadata row
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildHorizontalArticleCard(
                      title: 'Kesehatan mental sama pentingnya fisik',
                      imagePath:
                          'lib/assets/images/artikel/kesehatan_mental.png',
                    ),
                    _buildHorizontalArticleCard(
                      title: 'Overthinking merusak ketenangan dan fokus',
                      imagePath: 'lib/assets/images/beranda/artikel2.png',
                    ),
                    _buildHorizontalArticleCard(
                      title: 'Media sosial pengaruh kesehatan mental',
                      imagePath: 'lib/assets/images/beranda/artikel2.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'Terbaru',
                  style: TextStyle(
                    fontSize: 16,
                    color: primary[90],
                    fontWeight: FontWeight.bold,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Column(
                  children: [
                    ArticleCard(
                      title:
                          'Pentingnya Dukungan Sosial dalam Menjaga Kesehatan Mental',
                      imagePath: 'lib/assets/images/beranda/artikel1.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Kesepian dapat memberi dampak buruk bagi mental seseorang',
                      imagePath: 'lib/assets/images/beranda/artikel2.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Teman baik kurangi beban pikiran yang menumpuk terus',
                      imagePath: 'lib/assets/images/beranda/artikel3.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Empati tingkatkan kesejahteraan emosional dalam kehidupan manusia',
                      imagePath: 'lib/assets/images/artikel/empati.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Dipahami orang lain kurangi kecemasan yang berlebihan sekali',
                      imagePath: 'lib/assets/images/artikel/kecemasan.png',
                    ),
                    const SizedBox(height: 16),
                    ArticleCard(
                      title:
                          'Bantuan kecil berpengaruh sangat besar untuk orang lain',
                      imagePath: 'lib/assets/images/artikel/bantuankecil.png',
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
