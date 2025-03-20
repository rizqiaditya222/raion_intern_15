import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Meditasi',
          style: TextStyle(
            color: Colors.black,
            fontFamily: "Nunito",
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black, size: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main meditation image with video controls
            Stack(
              children: [
                Container(
                  height: 320,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/images/meditasi/video_image/video3.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),

            // Title, author and follow button
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Meditasi Untuk Anxiety',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xFFECF4FF),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: const Text(
                          'Ikuti',
                          style: TextStyle(
                            color: Color(0xFF193A63),
                            fontSize: 12,
                            fontFamily: "Nunito",
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Farah Nurhan',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: "Nunito",
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),

            // Video list items
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  _buildVideoListItem(
                    'lib/assets/images/meditasi/video_image/video4.png',
                    'Pikiran yang kacau?',
                    'Farah Nurhan',
                  ),
                  const SizedBox(height: 12),
                  _buildVideoListItem(
                    'lib/assets/images/meditasi/video_image/video6.png',
                    'Lari Sejenak',
                    'Farah Nurhan',
                  ),
                  const SizedBox(height: 12),
                  _buildVideoListItem(
                    'lib/assets/images/meditasi/video_image/video1.png',
                    'Tanpa bipolar',
                    'Farah Nurhan',
                  ),
                  const SizedBox(height: 12),
                  _buildVideoListItem(
                    'lib/assets/images/meditasi/video_image/video5.png',
                    'Kedamaian',
                    'Farah Nurhan',
                  ),
                ],
              ),
            ),
            // Add some bottom padding
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoListItem(String imageAsset, String title, String author) {
    return Row(
      children: [
        // Thumbnail image
        ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: SizedBox(
            width: 100,
            height: 120,
            child: Image.asset(
              imageAsset,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Text content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4),
              Text(
                author,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: "Nunito",
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
        // More options icon
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black54),
          onPressed: () {},
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
        ),
      ],
    );
  }
}
