import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/features/presentation/provider/appointment_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/date_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/form_provider.dart';
import 'package:raion_intern_15/features/presentation/provider/create_appoinment_provider.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/information_form.dart';
import 'package:raion_intern_15/features/presentation/screens/consultation_screen/payment.dart';
import '../../../../assets/color.dart';
import '../../provider/auth_provider.dart';
import '../../provider/payment_provider.dart';
import '../../provider/step_provider.dart';
import 'appointment_date.dart';

class StepperScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appointmentProvider = Provider.of<AppointmentProvider>(context, listen: false);
    final formProvider = Provider.of<InformationFormProvider>(context, listen: false);
    final dateProvider = Provider.of<DateProvider>(context, listen: false);
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
                          ),
                        ),
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
                          controlsBuilder:
                              (BuildContext context, ControlsDetails details) {
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 32),
                    child: SubmitButton(
                      myText: stepProvider.buttonText,
                      onPressed: () {
                        if (stepProvider.currentStep == 0) {
                          appointmentProvider.updateFullName(formProvider.nameController.text);
                          appointmentProvider.updateGender(formProvider.selectedConsultation ?? '');
                          appointmentProvider.updateConsultation(formProvider.selectedConsultation ?? '');
                          appointmentProvider.updateHeight(double.tryParse(formProvider.heightController.text) ?? 0.0);
                          appointmentProvider.updateWeight(double.tryParse(formProvider.weightController.text) ?? 0.0);
                          appointmentProvider.updateAddress(formProvider.addressController.text);
                          stepProvider.nextStep();
                        } else if (stepProvider.currentStep == 1) {
                          appointmentProvider.updateDateTime(dateProvider.selectedDate!, dateProvider.selectedTime!);
                          stepProvider.nextStep();
                        } else {
                          showSelectedPaymentModal(context);
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

  void showSelectedPaymentModal(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final user = authProvider.currentUser;
    final appointmentProvider = Provider.of<AppointmentProvider>(context, listen: false);
    final createAppointmentProvider = Provider.of<CreateAppoinmentProvider>(context, listen: false);
    final paymentProvider = Provider.of<PaymentProvider>(context, listen: false);
    final stepProvider = Provider.of<StepProvider>(context, listen: false);
    final formProvider = Provider.of<InformationFormProvider>(context, listen: false);
    final dateProvider = Provider.of<DateProvider>(context, listen: false);

    Widget buildRowText(String leftText, String rightText,
        {Color color = const Color(0xFF3D3B3B)}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(leftText, style: TextStyle(fontSize: 16, color: color)),
          Text(rightText,
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16, color: color)),
        ],
      );
    }

    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),

      builder: (context) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Konfirmasi Pembelian",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text("Cek kembali rincian transaksi kamu dibawah ini",
                  style: TextStyle(fontSize: 16)),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: defaultLightSilver[100]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    buildRowText("Konsultasi Online", "Rp100.000",
                        color: defaultLightSilver[100]!),
                    SizedBox(height: 24),
                    buildRowText("Biaya Admin", "Rp5.000",
                        color: defaultLightSilver[100]!),
                    SizedBox(height: 24),
                    Image.asset(line),
                    SizedBox(height: 24),
                    buildRowText("Total", "Rp105.000"),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                    color: defaultLightSilver[100]!,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Metode Pembayaran",
                            style: TextStyle(
                                fontSize: 16, color: defaultLightSilver[100]!)),
                        Image.asset(paymentProvider.selectedPaymentImage,
                            height: 50),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 8),
              SizedBox(height: 24),
              SubmitButton(
                  myText: "Bayar",
                  onPressed: () {
                    stepProvider.resetStep();
                    formProvider.resetForm();
                    createAppointmentProvider.createAppointment(
                        userID: user!.id,
                        doctorID: appointmentProvider.doctorID,
                        dateTime: appointmentProvider.dateTime,
                        status: "pending",
                        fullName: appointmentProvider.fullName,
                        gender: appointmentProvider.gender,
                        consultation: appointmentProvider.consultation,
                        height: appointmentProvider.height,
                        weight: appointmentProvider.weight,
                        address: appointmentProvider.address);

                    Navigator.pushReplacementNamed(context, "/success");
                  })
            ],
          ),
        );
      },
    );
  }
}
