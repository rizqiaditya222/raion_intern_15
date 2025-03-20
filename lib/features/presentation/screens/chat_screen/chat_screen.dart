import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/data/models/appointment_model.dart';
import 'package:raion_intern_15/features/presentation/screens/chat_screen/display_message.dart';
import '../../../../assets/color.dart';
import '../../../../assets/constants/image_strings.dart';
import '../../../domain/entities/appointment.dart';
import '../../provider/auth_provider.dart';
import '../../provider/create_appoinment_provider.dart';
import 'dart:async';
import 'package:intl/intl.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final TextEditingController messageController = TextEditingController();
  late Timer _timer;
  late ValueNotifier<int> _remainingSecondsNotifier;
  String appointmentId = "";

  @override
  void initState() {
    super.initState();
    _remainingSecondsNotifier = ValueNotifier<int>(600);
    _startCountdown();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (appointmentId.isNotEmpty) {
        _addInitialMessage();
      }
    });
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSecondsNotifier.value > 0) {
        _remainingSecondsNotifier.value--;
      } else {
        _timer.cancel();
        _endSession();
      }
    });
  }

  String doctorName = "";

  void _addInitialMessage() async {
    CollectionReference chatCollection = firebaseFirestore
        .collection("Messages")
        .doc(appointmentId)
        .collection("Chats");

    QuerySnapshot snapshot = await chatCollection.get();

    if (snapshot.docs.isEmpty) {
      await chatCollection.add({
        'message': "Halo! Saya ${doctorName}. Apa yang bisa saya bantu hari ini?",
        'time': DateTime.now(),
        'name': doctorName,
      });
    }
  }


  void _endSession() async {
    final createAppointmentProvider =
    Provider.of<CreateAppoinmentProvider>(context, listen: false);
    if (appointmentId.isNotEmpty) {
      await createAppointmentProvider.deleteAppointmentById(appointmentId);
    }
    if (mounted) {
      Navigator.pushReplacementNamed(context, "/end");
    }
  }

  @override
  void dispose() {
    _timer.cancel();
    _remainingSecondsNotifier.dispose();
    messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final args =
    ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (appointmentId.isEmpty) {
      appointmentId = args?['appointmentId'] ?? "";
    }

    doctorName = args?['doctorName'] ?? "Dokter";
    String currentUserName = authProvider.currentUser?.fullName ?? "Pengguna";

    return Container(
      color: primary[90],
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: primary[90],
            centerTitle: false,
            toolbarHeight: 80,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: _endSession,
            ),
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double maxTextWidth = constraints.maxWidth * 0.45;

                return FlexibleSpaceBar(
                  titlePadding:
                  const EdgeInsets.only(left: 56, bottom: 12, right: 16),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 48,
                            width: 48,
                            decoration: BoxDecoration(
                              color: Colors.pink,
                              borderRadius: BorderRadius.circular(28),
                              image: DecorationImage(
                                image: AssetImage(doctorImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: maxTextWidth),
                            child: Text(
                              doctorName,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(color: Colors.white, fontSize: 16),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: ValueListenableBuilder<int>(
                          valueListenable: _remainingSecondsNotifier,
                          builder: (context, remainingSeconds, child) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  _formatTime(remainingSeconds),
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                                const Text("Akhir sesi",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14)),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          body: Column(
            children: [
              Expanded(
                child: DisplayMessage(
                    name: currentUserName, appointmentId: appointmentId),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    const Icon(Icons.attachment),
                    Expanded(
                      child: TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          fillColor: Color(0xFFAFAFAF),
                          hintText: "Message",
                          contentPadding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: primary[90],
                      ),
                      child: IconButton(
                        onPressed: () {
                          if (messageController.text.isNotEmpty) {
                            firebaseFirestore
                                .collection("Messages")
                                .doc(appointmentId)
                                .collection("Chats")
                                .add({
                              'message': messageController.text.trim(),
                              'time': DateTime.now(),
                              'name': currentUserName,
                            });

                            messageController.clear();
                          }
                        },
                        icon: const Icon(Icons.send_sharp, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }
}

