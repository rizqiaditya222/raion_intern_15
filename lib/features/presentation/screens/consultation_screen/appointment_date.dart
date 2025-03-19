import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/features/presentation/provider/date_provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class AppointmentDate extends StatefulWidget {
  const AppointmentDate({super.key});

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
  DateTime today = DateTime.now();
  String? selectedTime;
  final List<String> appointmentTimes = [
    "08:00", "09:00", "10:00", "11:00", "13:00",
    "14:00", "15:00", "16:00", "17:00", "20:00"
  ];

  String getFormattedDate(DateTime date) {
    return DateFormat('EEEE, d MMMM', 'id_ID').format(date); // Format dalam bahasa Indonesia
  }

  @override
  Widget build(BuildContext context) {

    final dateProvider = Provider.of<DateProvider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFD4E6FE),
            borderRadius: BorderRadius.circular(28),
          ),
          padding: const EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              children: [
                SizedBox(height: 8,),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Pilih Tanggal",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        getFormattedDate(today),
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color(0xFF3D3B3B)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                TableCalendar(
                  locale: 'id_ID',
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                  calendarStyle: CalendarStyle(
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
                  selectedDayPredicate: (day) => isSameDay(day, today),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      today = selectedDay;
                    });
                    dateProvider.updateSelectedDate(today);
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),

        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Pilih Jam",
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 10),

        SizedBox(
          height: 150,
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 2,
            ),
            itemCount: appointmentTimes.length,
            itemBuilder: (context, index) {
              String time = appointmentTimes[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedTime = time;
                  });
                  dateProvider.updateSelectedTime(selectedTime ?? "08:00");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: selectedTime == time ? primary[90] : Colors.grey[200],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(
                    time,
                    style: TextStyle(
                        color: selectedTime == time ? Colors.white : Colors.black
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
