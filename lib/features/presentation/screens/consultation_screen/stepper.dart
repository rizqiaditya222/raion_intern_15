import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/information_form.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/payment.dart';
import '../../../../assets/color.dart';
import '../../provider/step_provider.dart';
import 'appointment_date.dart';

class StepperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<StepProvider>(
      builder: (context, stepProvider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primary[90],
            title: Text(
              stepProvider.appbarText,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall
                  ?.copyWith(color: Colors.white, fontSize: 16),
            ),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                if (stepProvider.currentStep > 0) {
                  stepProvider.previousStep();
                } else {
                  Navigator.pop(context);
                }
              },
            ),
          ),
          body: Container(
            color: Colors.white,
            child: Theme(
              data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                  primary: Color(0xFFF5D161),
                  onSurface: Colors.grey,

                ),
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.white,
                      child: Theme(
                        data: Theme.of(context).copyWith(
                            canvasColor: Colors.white,
                            colorScheme: ColorScheme.light(
                            primary: Color(0xFFF5D161),
                            onSurface: Colors.grey,
                            secondary: Color(0xFFF5D161),
                          ),),
                        child: Stepper(
                          elevation: 0,
                          type: StepperType.horizontal,
                          currentStep: stepProvider.currentStep,
                          steps: [
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text("Informasi"),
                              content: InformationForm(),
                              isActive: stepProvider.currentStep >= 0,
                            ),
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text("Tanggal"),
                              content: AppointmentDate(),
                              isActive: stepProvider.currentStep >= 1,
                            ),
                            Step(
                              title: const SizedBox.shrink(),
                              label: const Text("Konfirmasi"),
                              content: Payment(),
                              isActive: stepProvider.currentStep >= 2,
                            ),
                          ],
                          controlsBuilder: (BuildContext context, ControlsDetails details) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32),
                    child: SubmitButton(
                      myText: stepProvider.buttonText,
                      onPressed: () {
                        if (stepProvider.currentStep < 2) {
                          stepProvider.nextStep();
                        } else {
                          Navigator.pushReplacementNamed(context, '/success');
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
