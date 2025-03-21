import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import '../../../../assets/color.dart';
import '../../../data/models/mood_model.dart';
import '../../provider/mood_provider.dart';

class MoodDetailScreen extends StatelessWidget {
  final DateTime selectedDate;

  const MoodDetailScreen({super.key, required this.selectedDate});

  @override
  Widget build(BuildContext context) {
    final moodHistory = Provider.of<MoodProvider>(context).moodHistory;

    DateTime normalizedDate = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    MoodModel? moodEntry = moodHistory.firstWhere(
          (mood) =>
      DateTime(mood.date.year, mood.date.month, mood.date.day) ==
          normalizedDate,
      orElse: () => MoodModel(
        date: selectedDate,
        mood: '',
        note: 'Tidak ada catatan',
        sleep: 0,
        stress: 0,
        kesibukan: 0,
      ),
    );

    String formattedDate = DateFormat("d MMMM yyyy", "id_ID").format(selectedDate.toLocal());
    String formattedTime = DateFormat("HH.mm").format(selectedDate.toLocal());
    String dateTimeDisplay = "$formattedDate | $formattedTime";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Detail Mood",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: moodEntry.mood.isNotEmpty
            ? Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD4E6FE),
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(moodEntry.mood, width: 79, height: 79),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xFFFFBEBE),
                        ),
                        child: const Text(
                          "Sendiri",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFD93B2E),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        dateTimeDisplay, // Tanggal & jam terformat
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD4E6FE),
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  _buildStaticBar("Kesibukan", moodEntry.kesibukan),
                  _buildStaticBar("Level Stress", moodEntry.stress),
                  _buildStaticBar("Kualitas Tidur ", moodEntry.sleep),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFFD4E6FE),
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Catatan",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    moodEntry.note,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        )
            : const Center(child: Text("Tidak ada data mood untuk tanggal ini.")),
      ),
    );
  }
}
Widget _buildStaticBar(String label, int value) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      const SizedBox(height: 4),
      LayoutBuilder(
        builder: (context, constraints) {
          double barWidth = ((value - 1) / 4) * constraints.maxWidth;
          return Stack(
            clipBehavior: Clip.none, // Agar bullet tidak terpotong
            children: [
              // Background Bar (Abu-abu)
              Container(
                height: 10,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              // Foreground Bar (Hijau)
              Container(
                height: 10,
                width: barWidth,
                decoration: BoxDecoration(
                  color: const Color(0xFF9BB167),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              // Bullet Indicator
              Positioned(
                left: barWidth - 8, // Agar bullet tepat di ujung bar hijau
                top: -3, // Naikkan bullet agar tidak tenggelam
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9BB167), // Warna hijau
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2), // Outline putih
                  ),
                ),
              ),
            ],
          );
        },
      ),
      const SizedBox(height: 4),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          5,
              (index) => Text(
            "${index + 1}",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      const SizedBox(height: 16),
    ],
  );
}

