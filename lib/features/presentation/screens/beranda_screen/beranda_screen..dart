import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/features/presentation/screens/profile_screen/profile_screen.dart';

import '../../provider/auth_provider.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {

  bool _showFirstContainer = true;

  @override
  void initState() {
    super.initState();
    // Set up a timer to switch containers every 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      _toggleContainer();
    });
  }

  void _toggleContainer() {
    setState(() {
      _showFirstContainer = !_showFirstContainer;
    });

    // Continue toggling every 10 seconds
    Future.delayed(const Duration(seconds: 10), () {
      if (mounted) {
        _toggleContainer();
      }
    });
  }

  // Add this function in the _BerandaScreenState class
  void _showTestSelectionDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Container(
            height: 400, // Menambah tinggi agar lebih besar
            width: 500, // Menambah lebar agar lebih luas
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.max, // Menggunakan ukuran maksimal
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Memusatkan elemen
                  children: [
                    Expanded(
                      child: Text(
                        'Pilih test yang kamu butuhkan',
                        textAlign:
                            TextAlign.center, // Membuat teks berada di tengah
                        style: const TextStyle(
                          fontSize: 18, // Memperbesar ukuran teks
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                      ),
                    ),
                    Container(
                      width: 24, // Lebar lingkaran kecil
                      height: 24, // Tinggi lingkaran kecil
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF193A63), // Warna biru gelap
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 14, // Ukuran ikon lebih kecil
                        ),
                        onPressed: () => Navigator.pop(context),
                        padding: EdgeInsets.zero, // Menghapus padding default
                        constraints:
                            const BoxConstraints(), // Menghilangkan batasan default
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Expanded(
                  child: Column(
                    children: [
                      _buildTestOption(
                        imagePath:
                            'lib/assets/images/testmanager/testpositif.png',
                        title: 'Test kesehatan mental positif',
                        onTap: () {
                          Navigator.pushNamed(context, '/testpositif');
                        },
                      ),
                      const SizedBox(height: 16),
                      _buildTestOption(
                        imagePath:
                            'lib/assets/images/testmanager/testnegatif.png',
                        title: 'Test kesehatan mental negatif',
                        onTap: () {
                          Navigator.pushNamed(context, '/testnegatif');
                        },
                        backgroundColor: const Color(0xFFF4D160),
                      ),
                      const SizedBox(height: 16),
                      _buildTestOption(
                        imagePath:
                            'lib/assets/images/testmanager/testhidup.png',
                        title: 'Test kesehatan gaya hidup',
                        onTap: () {
                          Navigator.pushNamed(context, '/testhidup');
                        },
                        backgroundColor: Colors.grey.shade400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Add this helper widget in the _BerandaScreenState class
  Widget _buildTestOption({
    required String imagePath,
    required String title,
    required VoidCallback onTap,
    Color backgroundColor = const Color(0xFF9FDAFD),
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF0F2A4A),
                borderRadius: BorderRadius.circular(40),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  imagePath,
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF0F2A4A),
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Nunito',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildKenaliDiriContainer() {
    return Container(
      key: const ValueKey('kenaliDiri'),
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
                  padding: const EdgeInsets.all(8.0),
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
                  onPressed: () {
                    _showTestSelectionDialog();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white54,
                    backgroundColor: const Color(0xFF1A4D8C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Ikuti Tes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.add,
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
            'lib/assets/images/beranda/positiveAffirmation.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  Widget _buildTenanginDiriContainer() {
    return Container(
      key: const ValueKey('tenanginDiri'),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFEBE1C2),
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
                      'Tenangin Diri Kamu',
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
                  padding: const EdgeInsets.all(8.0),
                  child: Wrap(
                    children: const [
                      Text(
                        'Ikuti panduan meditasi untuk hidup damai dan menenangkan',
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/meditasi');
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white54,
                    backgroundColor: const Color(0xFF1A4D8C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Meditasi Sekarang',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            'lib/assets/images/test_result/deepbreath.png',
            width: 120,
            height: 120,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ProfileScreen(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          backgroundColor: const Color(0xFF193A63),

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
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.black, // Changed to black
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hai, ${user?.fullName}!",

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
                          width: 16,
                          height: 16,
                          fit: BoxFit.cover,

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
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
                child: _showFirstContainer
                    ? _buildKenaliDiriContainer()
                    : _buildTenanginDiriContainer(),
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
                    onPressed: () {
                      Navigator.pushNamed(context, '/sleeptracker');
                    },

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
                    GestureDetector(
                      onTap: () {
                        //Navigate TODO
                        // Tambahkan navigasi atau aksi lain di sini jika perlu
                      },
                      child: _buildCalendarWidget(
                        'Januari 2025',
                        '0/30',
                        Colors.white,
                        Color(0xFFEE8834),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        //Navigate TODO
                      },
                      child: _buildCalendarWidget(
                        'Februari 2025',
                        '21/28',
                        Colors.white,
                        Color(0xFF88BFFD),
                      ),
                    ),
                    const SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        //Navigate TODO
                      },
                      child: _buildCalendarWidget(
                        'Maret 2025',
                        '27/31',
                        Colors.white,
                        Color(0xFFA688FD),
                      ),

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
                    onPressed: () {
                      Navigator.pushNamed(context, '/artikel');
                    },

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
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/artikelmental');
                },
                child: _buildArticleCard(
                  'Pentingnya Dukungan Sosial dalam Menjaga Kesehatan Mental',
                  'lib/assets/images/beranda/artikel1.png',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/artikelmental');
                },
                child: _buildArticleCard(
                  'Kesepian dapat memberi dampak buruk bagi mental seseorang',
                  'lib/assets/images/beranda/artikel2.png',
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/artikelmental');
                },
                child: _buildArticleCard(
                  'Teman baik kurangi beban pikiran yang menumpuk terus',
                  'lib/assets/images/beranda/artikel3.png',
                ),
              ),
              SizedBox(
                height: 24,
              )
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
