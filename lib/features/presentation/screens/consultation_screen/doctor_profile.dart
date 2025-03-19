import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/features/presentation/provider/appointment_provider.dart';
import '../../../../assets/constants/image_strings.dart';
import '../../provider/doctor_provider.dart';

class DoctorProfile extends StatelessWidget {
  DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final appointmentProvider = Provider.of<AppointmentProvider>(context);
    final doctor = doctorProvider.doctor;

    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Stack(children: [
        SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(45),
                      bottomRight: Radius.circular(45),
                    ),
                    child: Image.asset(
                      doctorImage,
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.4,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.35,
                    left: 40,
                    right: 40,
                    child: Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primary[90],
                        borderRadius: BorderRadius.circular(36),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            spreadRadius: 2,
                          )
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            doctor!.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 20),
                              SizedBox(width: 4),
                              Text("${doctor.rating}",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(width: 16),
                              Icon(Icons.location_on,
                                  color: Colors.white, size: 20),
                              SizedBox(width: 4),
                              Text("${doctor.distance} m",
                                  style: TextStyle(color: Colors.white)),
                              SizedBox(width: 16),
                              Icon(Icons.psychology,
                                  color: Colors.white, size: 20),
                              SizedBox(width: 4),
                              Text(doctor.specialization,
                                  style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 64),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Biografi singkat",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      doctor.bio,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Pendekatan Terapi",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    Column(
                      children:
                          List.generate(doctor.pendekatan.length, (index) {
                        final pendekatan = doctor.pendekatan[index];
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(check),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    pendekatan.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(fontSize: 16),
                                  ),
                                  Text(
                                    pendekatan.description,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(fontSize: 14),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ulasan",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 16),
                        ),
                        Text(
                          "Lihat semua",
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium
                              ?.copyWith(fontSize: 14),
                        ),
                      ],
                    ),
                    const SizedBox(height: 32),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 108,
                            width: 108,
                            decoration: BoxDecoration(
                              color: Color(0x8AE8B64C),
                              borderRadius: BorderRadius.circular(54),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "${doctor.rating}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontSize: 48,
                                        color: Colors.white,
                                        height: 0.9,
                                      ),
                                ),
                                Text(
                                  "${doctor.ratingAmount}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineLarge
                                      ?.copyWith(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 16),
                          Image.asset(chart)
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    SubmitButton(
                      myText: "Konsultasi",
                      onPressed: () {
                        appointmentProvider.updateDoctorID(doctor.id);
                        Navigator.pushReplacementNamed(context, '/step');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.05,
          left: 19,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: defaultLightSilver,
                    blurRadius: 0,
                    spreadRadius: 3,
                    offset: Offset(0, 0),
                  ),
                ],
              ),
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                backgroundColor: Colors.white,
                elevation: 0,
                hoverElevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                splashColor: Colors.transparent,
                shape: const CircleBorder(),
                child: Icon(Icons.keyboard_arrow_left, color: primary[90], size: 24),
              ),
            ),
          ),
        ),

      ]),
    );
  }
}
