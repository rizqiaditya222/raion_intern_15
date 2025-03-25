import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import '../../../../assets/color.dart';
import '../../../data/models/mood_model.dart';
import '../../provider/auth_provider.dart';
import '../../provider/mood_provider.dart';
import 'mood_detail_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime today = DateTime.now();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final user = authProvider.currentUser;

      if (user != null) {
        Provider.of<MoodProvider>(context, listen: false).fetchMoodHistory(user.id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final moodData = Provider.of<MoodProvider>(context).moodData;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Riwayat Mood",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/main");
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mood Stabil Bulan Ini", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
            Text("Terus pertahankan kebiasaan baikmu!", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontSize: 16)),
            SizedBox(height: 16),
            Text("Kalender Mood", style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 20)),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFECF4FF),
                borderRadius: BorderRadius.circular(28),
              ),
              child: TableCalendar(
                locale: 'id_ID',
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  cellMargin: EdgeInsets.symmetric(vertical: 8),
                  selectedDecoration: BoxDecoration(
                    color: primary[90],
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: primary[90]?.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  defaultDecoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                ),
                focusedDay: today,
                firstDay: DateTime(2000, 01, 01),
                lastDay: DateTime(2030, 01, 01),
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, date, events) {
                    final moodHistory = Provider.of<MoodProvider>(context, listen: false).moodHistory;

                    DateTime normalizedDate = DateTime(date.year, date.month, date.day);
                    MoodModel? moodEntry = moodHistory.firstWhere(
                          (mood) => DateTime(mood.date.year, mood.date.month, mood.date.day) == normalizedDate,
                      orElse: () => MoodModel(date: date, mood: '', note: '', sleep: 0, stress: 0, kesibukan: 0),
                    );

                    if (moodEntry.mood.isNotEmpty) {
                      return Positioned(
                        top: -10,
                        child: Image.asset(
                          moodEntry.mood, // Menggunakan format dari MoodDetailScreen
                          width: 24,
                          height: 24,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },

                ),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    today = selectedDay;
                  });

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MoodDetailScreen(selectedDate: selectedDay),
                    ),
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
