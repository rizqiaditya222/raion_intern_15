import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  // int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Color(0xFF193A63),
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.only(top: 21.0, left: 24, right: 16),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                    border: Border.all(color: Colors.white, width: 1),
                  ),
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hai, Anonim!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "lib/assets/images/beranda/api.png",
                          width: 16, // Sesuaikan ukuran jika perlu
                          height: 16,
                          fit: BoxFit.cover, // Agar gambar tidak pecah
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          '124 streak mood',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontFamily: "Nunito",
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          automaticallyImplyLeading: false,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F1FF),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            children: const [
                              Text(
                                'Kenali Diri Kamu',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF193A63),
                                    fontFamily: "Nunito"),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.all(
                                8.0), // Atur padding sesuai kebutuhan
                            child: Wrap(
                              children: const [
                                Text(
                                  'Yuk, coba tes ini dan temukan apa yang benar-benar kamu butuhkan',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white54,
                              backgroundColor: const Color(0xFF1A4D8C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                            ),
                            child: const Row(
                              mainAxisSize:
                                  MainAxisSize.min, // Agar ukuran tidak melebar
                              children: [
                                Text(
                                  'Ikuti Tes',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                    width: 8), // Jarak antara teks dan ikon
                                Icon(
                                  Icons.add, // Ikon plus
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'lib/assets/images/beranda/positiveAffirmation.png', // Replace with your actual image path
                      width: 160,
                      height: 160,
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),

              // Recent Used section
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Riwayat Mood',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF193A63),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                ],
              ),

              // Calendar widgets
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildCalendarWidget(
                      'Januari 2025',
                      '0/30',
                      Colors.white,
                      Color(0xFFEE8834),
                    ),
                    const SizedBox(width: 12),
                    _buildCalendarWidget(
                      'Februari 2025',
                      '21/28',
                      Colors.white,
                      Color(0xFF88BFFD),
                    ),
                    const SizedBox(width: 12),
                    _buildCalendarWidget(
                      'Maret 2025',
                      '27/31',
                      Colors.white,
                      Color(0xFFA688FD),
                    ),
                  ],
                ),
              ),

              // Article section
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Artikel',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color(0xFF193A63),
                      fontWeight: FontWeight.w400,
                      fontFamily: "Nunito",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat semua',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF193A63),
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                      ),
                    ),
                  ),
                ],
              ),

              // Article cards
              const SizedBox(height: 10),
              _buildArticleCard(
                'Pentingnya Dukungan Sosial dalam Menjaga Kesehatan Mental',
                'lib/assets/images/beranda/artikel1.png',
              ),
              const SizedBox(height: 16),
              _buildArticleCard(
                'Kesepian dapat memberi dampak buruk bagi mental seseorang',
                'lib/assets/images/beranda/artikel2.png',
              ),
              const SizedBox(height: 16),
              _buildArticleCard(
                'Teman baik kurangi beban pikiran yang menumpuk terus',
                'lib/assets/images/beranda/artikel3.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarWidget(
      String month, String days, Color color, Color bgColor) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.emoji_emotions, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                month,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            days,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          // Calendar grid (simplified)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemCount: 28,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: index % 3 == 0 ? color : Colors.transparent,
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontSize: 8,
                      color: index % 3 == 0 ? Colors.white : Colors.black54,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(String title, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              imagePath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Spacer antara info & judul
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        "Mozaik",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.chat_bubble_outline,
                        size: 14,
                        color: Colors.grey.shade500,
                      ),
                      SizedBox(width: 4),
                      Text(
                        "28",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "12h",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Spacer(),
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
          ),
        ],
      ),
    );
  }
}
