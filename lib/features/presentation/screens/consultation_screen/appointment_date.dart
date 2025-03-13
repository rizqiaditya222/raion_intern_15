import 'package:flutter/material.dart';
import '../../../../assets/color.dart';
import 'package:table_calendar/table_calendar.dart';

class AppointmentDate extends StatefulWidget {
  const AppointmentDate({super.key});

  @override
  State<AppointmentDate> createState() => _AppointmentDateState();
}

class _AppointmentDateState extends State<AppointmentDate> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Pilih Tanggal",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: Column(

        children: [

          Container(
            child: TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              focusedDay: today,
              firstDay: DateTime(2000, 01, 01),
              lastDay: DateTime(2030, 01, 01),
            ),
          ),
        ],

      ),
    );
  }
}
