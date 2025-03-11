import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';

class EmptyConsultation extends StatelessWidget {
  const EmptyConsultation({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            Image.asset(emptyConsult),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Belum Ada Janji Konsultasi, Nih!",
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      "Sepertinya kamu belum bikin janji sama psikolog. Yuk, atur jadwal baru biar tetap merasa tenang dan didengar! ",
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center),
                  SizedBox(height: 30),
                  SizedBox(
                    width: 173,
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
                          Navigator.pushReplacementNamed(context, '/specialization');

                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Buat Janji Baru"),
                            SizedBox(
                              width: 8,
                            ),
                            Icon(Icons.add, color: Colors.white,)
                          ],
                        )),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
