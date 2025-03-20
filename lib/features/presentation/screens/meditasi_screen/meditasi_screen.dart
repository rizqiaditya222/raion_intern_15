import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class MeditasiScreen extends StatefulWidget {
  const MeditasiScreen({super.key});

  @override
  State<MeditasiScreen> createState() => _MeditasiScreenState();
}

class _MeditasiScreenState extends State<MeditasiScreen> {
  bool isVideoSelected = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meditasi',
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
      body: Column(
        children: [
          //segmented button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVideoSelected = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isVideoSelected ? primary[10] : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          border: Border.all(
                            color: const Color(0xFF193A63),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (isVideoSelected) // Menampilkan icon centang jika dipilih
                              const Icon(Icons.check,
                                  color: Color(0xFF193A63), size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Video',
                              style: TextStyle(
                                color: primary[90],
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isVideoSelected = false;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: !isVideoSelected ? primary[10] : Colors.white,
                          borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          border: Border.all(
                            color: const Color(0xFF193A63),
                            width: 1.5,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (!isVideoSelected) // Menampilkan icon centang jika Audio dipilih
                              const Icon(Icons.check,
                                  color: Color(0xFF193A63), size: 18),
                            const SizedBox(width: 8),
                            Text(
                              'Audio',
                              style: TextStyle(
                                color: primary[90],
                                fontWeight: FontWeight.bold,
                                fontFamily: "Nunito",
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //content
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (isVideoSelected) {
                  // Navigasi ke halaman khusus Video
                  Navigator.pushNamed(context, '/video');
                } else {
                  // Navigasi ke halaman khusus Audio
                  Navigator.pushNamed(context, '/audio');
                }
              },
              child:
                  isVideoSelected ? _buildVideoContent() : _buildAudioContent(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Relaksasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildVideoRow([
              {
                'image': 'lib/assets/images/meditasi/video_image/video1.png',
                'title': 'Meditasi untuk anxiety'
              },
              {
                'image': 'lib/assets/images/meditasi/video_image/video2.png',
                'title': 'Bersihkan Pikiran Negatif'
              },
            ]),
            const SizedBox(height: 24),
            Text(
              'Pilihan Terbaik untuk Kamu',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildVideoPlayerItem(
              'lib/assets/images/meditasi/video_image/video3.png',
              'Meditasi untuk anxiety',
            ),
            const SizedBox(height: 24),
            Text(
              'Mental Positif',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            _buildVideoRow([
              {
                'image': 'lib/assets/images/meditasi/video_image/video4.png',
                'title': 'Bebaskan Diri Sekarang'
              },
              {
                'image': 'lib/assets/images/meditasi/video_image/video5.png',
                'title': 'Harmoni Dalam Diri'
              },
            ]),
            const SizedBox(height: 12),
            _buildVideoRow([
              {
                'image': 'lib/assets/images/meditasi/video_image/video6.png',
                'title': 'Relaksasi Jiwa Raga'
              },
              {
                'image': 'lib/assets/images/meditasi/video_image/video7.png',
                'title': 'Berdamai dengan Diri'
              },
            ]),
            const SizedBox(height: 12),
            _buildVideoRow([
              {
                'image': 'lib/assets/images/meditasi/video_image/video8.png',
                'title': 'Hening & Seimbang'
              },
              {
                'image': 'lib/assets/images/meditasi/video_image/video9.png',
                'title': 'Meredakan cemas'
              },
            ]),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String imageAsset, String title) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imageAsset),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Nunito",
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVideoRow(List<Map<String, String>> items) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildVideoItem(items[0]['image']!, items[0]['title']!),
        const SizedBox(width: 12),
        _buildVideoItem(items[1]['image']!, items[1]['title']!),
      ],
    );
  }

  Widget _buildVideoPlayerItem(String imageAsset, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imageAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            fontFamily: "Nunito",
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildAudioContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Featured horizontal scrolling section
            Text(
              'Relaksasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 180,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  // Make the center item larger
                  double scale = index == 1 ? 1.0 : 0.85;
                  return Transform.scale(
                    scale: scale,
                    child: Container(
                      width: 260,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      child: _buildAudioCard(
                        getMeditationImageAsset(index),
                        getMeditationTitle(index),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 24),

            // Title for grid section
            Text(
              'Relaksasi',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: "Nunito",
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 12),

            // Grid section with image-left, text-right layout
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8, // Number of rows
              itemBuilder: (context, rowIndex) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildAudioItem(
                          getMeditationImageAsset(rowIndex * 2),
                          getMeditationTitle(rowIndex * 2),
                          getColorForIndex(rowIndex * 2),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildAudioItem(
                          getMeditationImageAsset(rowIndex * 2 + 1),
                          getMeditationTitle(rowIndex * 2 + 1),
                          getColorForIndex(rowIndex * 2 + 1),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

// For the featured cards with overlay text and play button
  Widget _buildAudioCard(String imageAsset, String title) {
    return Stack(
      children: [
        // Background image
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image(
            image: AssetImage(imageAsset),
            height: 180,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),

        // Gradient overlay for better text visibility
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(0.7),
              ],
            ),
          ),
        ),

        // Text and play button
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: "Nunito",
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.2),
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

// For the grid items with image on left, text on right
  Widget _buildAudioItem(String imageAsset, String title, Color bgColor) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Left side - Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            child: Image(
              image: AssetImage(imageAsset),
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          // Right side - Text content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Nunito",
                      color: primary[90],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

// Helper methods - updated to return asset paths
  String getMeditationImageAsset(int index) {
    List<String> images = [
      "lib/assets/images/artikel/kesehatan_mental.png",
      "lib/assets/images/artikel/bantuankecil.png",
      "lib/assets/images/artikel/bipolar2.png",
      "lib/assets/images/artikel/kecemasan.png",
      "lib/assets/images/artikel/bipolar6.png",
    ];
    return images[index % images.length];
  }

  String getMeditationTitle(int index) {
    List<String> titles = [
      "Meditasi untuk Tidur",
      "Meditasi Diri",
      "Tenangkan Pikiran",
      "Meditasi Pagi",
      "Healing & Relaxing",
      "Fokus & Konsentrasi",
      "Meditasi untuk Anxiety",
      "Meditasi 5 Menit",
    ];
    return titles[index % titles.length];
  }

  Color getColorForIndex(int index) {
    List<Color> colors = [
      Color(0xFFFAFAFA),
      Color(0xFFFAFAFA),
      Color(0xFFFAFAFA),
      Color(0xFFFAFAFA),
    ];
    return colors[index % colors.length];
  }
}
