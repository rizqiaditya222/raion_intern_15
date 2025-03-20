import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/empty_consultation.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/end_session.dart';

import '../../../../assets/color.dart';
import '../../../../assets/constants/image_strings.dart';
import '../../../data/models/doctor_model.dart';
import '../../../domain/entities/appointment.dart';
import '../../provider/auth_provider.dart';
import '../../provider/create_appoinment_provider.dart';
import 'package:intl/intl.dart';

import 'consultation.dart';

class UpcomingConsultation extends StatefulWidget {
  const UpcomingConsultation({super.key});

  @override
  _UpcomingConsultation createState() => _UpcomingConsultation();
}

class _UpcomingConsultation extends State<UpcomingConsultation> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final currentUserID = Provider.of<AuthProvider>(context, listen: false).currentUser?.id;
      Provider.of<CreateAppoinmentProvider>(context, listen: false)
          .fetchAppointmentsWithDoctors(currentUserID!);
    });
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<CreateAppoinmentProvider>(context);
    return Scaffold(
      body: provider.appointmentsWithDoctors.isEmpty
          ? const Center(child: Text("Tidak ada konsultasi yang dijadwalkan"))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const EndSession(),
            Column(
              children: provider.appointmentsWithDoctors.map((data) {
                final appointment = data['appointment'] as AppointmentEntity;
                final doctor = data['doctor'] as DoctorModel?;

                String formattedTime = DateFormat.Hm().format(appointment.dateTime);
                int hour = int.parse(DateFormat.H().format(appointment.dateTime));
                int hourPlusOne = hour + 1;

                return appoinment_list(
                  doctor: doctor,
                  formattedTime: formattedTime,
                  hourPlusOne: hourPlusOne,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
