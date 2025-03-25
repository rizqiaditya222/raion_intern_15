import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/data/models/appointment_model.dart';
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
  _UpcomingConsultationState createState() => _UpcomingConsultationState();
}

class _UpcomingConsultationState extends State<UpcomingConsultation> {
  List<Map<String, dynamic>> appointmentsWithDoctors = [];
  String currentUserName = "Pengguna";

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final currentUserID = authProvider.currentUser?.id;
      String fullName = authProvider.currentUser?.fullName ?? "Pengguna";

      currentUserName = fullName.split(" ").first;

      if (currentUserID != null) {
        final provider =
        Provider.of<CreateAppoinmentProvider>(context, listen: false);

        provider.fetchAppointmentsWithDoctors(currentUserID).then((_) {
          setState(() {
            appointmentsWithDoctors = provider.appointmentsWithDoctors;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String doctorName = appointmentsWithDoctors.isNotEmpty
        ? (appointmentsWithDoctors.first['doctor'] as DoctorModel?)?.name ?? "Dokter"
        : "Dokter";

    String hour = "jam";

    if (appointmentsWithDoctors.isNotEmpty) {
      final appointment = appointmentsWithDoctors.first['appointment'] as AppointmentModel?;
      if (appointment != null) {
        hour = DateFormat.Hm().format(appointment.dateTime);
      }
    }

    return Scaffold(
      body: appointmentsWithDoctors.isEmpty
          ? const Center(child: Text("Tidak ada konsultasi yang dijadwalkan"))
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth > 700 ? 700 : constraints.maxWidth;
                return Center(
                  child: Container(
                    width: maxWidth,
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                        Image.asset(
                          "lib/assets/images/walk.png",
                          width: maxWidth * 0.8,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Janji Temu yang Akan Datang",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "Hai, $currentUserName! Kamu punya janji temu dengan $doctorName pada jam $hour",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: primaryBlack),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Column(
              children: appointmentsWithDoctors.map((data) {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: primary[90],
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (appointmentsWithDoctors.isNotEmpty) {
                      final appointment = appointmentsWithDoctors.first['appointment'] as AppointmentModel?;
                      final appointmentId = appointment?.id ?? "";

                      Navigator.pushReplacementNamed(
                        context,
                        '/chat',
                        arguments: {
                          'doctorName': doctorName,
                          'appointmentId': appointmentId,
                        },
                      );
                    }
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Chat",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 16),
                      Icon(Icons.chat, color: Colors.white),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

}
