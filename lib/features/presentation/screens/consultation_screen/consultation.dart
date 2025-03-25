import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/empty_consultation.dart';

import '../../../../assets/color.dart';
import '../../../../assets/constants/image_strings.dart';
import '../../../data/models/doctor_model.dart';
import '../../../domain/entities/appointment.dart';
import '../../provider/auth_provider.dart';
import '../../provider/create_appoinment_provider.dart';
import 'package:intl/intl.dart';
import 'upcoming_consultation.dart';

class Consultation extends StatefulWidget {
  const Consultation({super.key});

  @override
  _ConsultationState createState() => _ConsultationState();
}

class _ConsultationState extends State<Consultation> {
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
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Konsultasi",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/specialization");
          },
        ),
      ),
      body:
      provider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : provider.appointmentsWithDoctors.isEmpty
          ? const EmptyConsultation()
          : ListView.builder(
        itemCount: provider.appointmentsWithDoctors.length,
        itemBuilder: (context, index) {
          final appointment = provider.appointmentsWithDoctors[index]['appointment'] as AppointmentEntity;
          final doctor = provider.appointmentsWithDoctors[index]['doctor'] as DoctorModel?;

          String formattedTime = DateFormat.Hm().format(appointment.dateTime);
          int hour = int.parse(DateFormat.H().format(appointment.dateTime));
          int hourPlusOne = hour + 1;

          return appoinment_list(doctor: doctor, formattedTime: formattedTime, hourPlusOne: hourPlusOne);
        },
      ),
    );
  }
}

class appoinment_list extends StatelessWidget {
  const appoinment_list({
    super.key,
    required this.doctor,
    required this.formattedTime,
    required this.hourPlusOne,
  });

  final DoctorModel? doctor;
  final String formattedTime;
  final int hourPlusOne;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/upcoming');
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 241, 241, 241),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: AssetImage(doctorImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  height: 56,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        doctor?.name ?? 'Nama Tidak Diketahui',
                        style: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 16),
                      ),
                      Row(
                        children: [
                          Image.asset(depresi, width: 20),
                          const SizedBox(width: 4),
                          Text(
                            "Ahli ${doctor?.specialization ?? 'Tidak Diketahui'}",
                            style: const TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            Row(
              children: [
                Image.asset(time),
                const SizedBox(width: 8),
                Text("${formattedTime} - ${hourPlusOne}:00", style: TextStyle(fontSize: 16, color: primaryBlack, fontWeight: FontWeight.w900),),
                const SizedBox(width: 16),
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color:primaryBlack ),
                ),
                const SizedBox(width: 16),
                Image.asset(money),
                const SizedBox(width: 8),
                Text("Rp105.000", style: TextStyle(fontSize: 16, color: primaryBlack, fontWeight: FontWeight.w900),),
              ],
            ),],
        ),
      ),
    );
  }
}
