import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import '../../../../assets/color.dart';

class DisplayMessage extends StatefulWidget {
  final String name;
  final String appointmentId; // Tambahkan appointmentId

  const DisplayMessage({super.key, required this.name, required this.appointmentId});

  @override
  State<DisplayMessage> createState() => _DisplayMessageState();
}

class _DisplayMessageState extends State<DisplayMessage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection("Messages")
          .doc(widget.appointmentId) // Ambil chat berdasarkan appointmentId
          .collection("Chats")
          .orderBy('time')
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          return const Center(child: Text("Belum ada pesan"));
        }
        return ListView.builder(
          itemCount: snapshot.data!.docs.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          primary: true,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          itemBuilder: (context, index) {
            QueryDocumentSnapshot qds = snapshot.data!.docs[index];
            Timestamp time = qds['time'];
            DateTime dateTime = time.toDate();
            bool isUser = widget.name == qds['name'];

            return Align(
              alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 4),
                padding: const EdgeInsets.all(12),
                constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                decoration: BoxDecoration(
                  color: isUser ? primary[90] : Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
                    bottomRight: isUser ? Radius.zero : const Radius.circular(12),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      qds["message"],
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(
                          fontSize: 12,
                          color: isUser ? Colors.white70 : Colors.black54,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}