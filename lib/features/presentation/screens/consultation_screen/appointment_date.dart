import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentDate extends StatefulWidget {
  const AppointmentDate({super.key});

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Pilih Tanggal",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        TableCalendar(
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          focusedDay: today,
          firstDay: DateTime(2000, 01, 01),
          lastDay: DateTime(2030, 01, 01),
          selectedDayPredicate: (day) => isSameDay(day, today),
        ),
      ],
    );
  }
}
