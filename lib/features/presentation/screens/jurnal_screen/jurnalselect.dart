import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class Jurnalselect extends StatefulWidget {
  const Jurnalselect({super.key});

  @override
  State<Jurnalselect> createState() => _JurnalselectState();
}

class _JurnalselectState extends State<Jurnalselect> {
  String selectedJournalType = ""; // Empty means nothing selected

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Jurnal',
          style: TextStyle(
              color: Colors.white,
              fontFamily: "Nunito",
              fontSize: 16,
              fontWeight: FontWeight.w700),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: primary[90],
        elevation: 2,
        toolbarHeight: 80,
        titleSpacing: -5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Yuk Buat Jurnal Hari ini!",
              style: TextStyle(
                  color: primary[90],
                  fontFamily: "Nunito",
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            Wrap(
              children: [
                Text(
                  "Menulis jurnal bisa membantumu lebih tenang dan memahami diri sendiri dengan lebih baik!",
                  style: TextStyle(
                    color: primary[90],
                    fontFamily: "Nunito",
                    fontSize: 18,
                  ),
                ),
              ],
            ),

            const SizedBox(
              height: 30,
            ),

            // Journal Voice Card
            Card(
              color: selectedJournalType == "voice"
                  ? Color(0xFFE6EBF2)
                  : Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: selectedJournalType == "voice"
                      ? primary[90]!
                      : Color(0xFF193A63),
                  width: selectedJournalType == "voice" ? 2 : 1,
                ),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedJournalType = "voice";
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Row untuk judul dan ikon panah
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Ikon lingkaran
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: primary[90],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.mic,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),

                              Text(
                                "Jurnal Suara",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primary[90],
                                ),
                              ),
                            ],
                          ),
                          selectedJournalType == "voice"
                              ? Icon(
                                  Icons.chevron_right,
                                  color: primary[90],
                                )
                              : Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF193A63),
                                ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      Text(
                        "Ceritakan dengan merekam suara apa yang terjadi hari ini. Kami akan mentranskripsikannya.",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          color: primary[90],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            Card(
              color: selectedJournalType == "text"
                  ? Color(0xFFE6EBF2)
                  : Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(
                  color: selectedJournalType == "text"
                      ? primary[90]!
                      : Color(0xFF193A63),
                  width: selectedJournalType == "text" ? 2 : 1,
                ),
              ),
              child: InkWell(
                onTap: () {
                  setState(() {
                    selectedJournalType = "text";
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: secondaryYellow[90],
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.edit_document,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                "Jurnal Teks",
                                style: TextStyle(
                                  fontFamily: "Nunito",
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: primary[90],
                                ),
                              ),
                            ],
                          ),
                          selectedJournalType == "text"
                              ? Icon(
                                  Icons.chevron_right,
                                  color: primary[90],
                                )
                              : Icon(
                                  Icons.chevron_right,
                                  color: Color(0xFF193A63),
                                ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "Tuliskan ceritamu di sini! Bagikan apa yang terjadi hari ini, perasaanmu, atau hal-hal yang ingin kamu ingat.",
                        style: TextStyle(
                          fontFamily: "Nunito",
                          fontSize: 14,
                          color: primary[90],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            const Spacer(),

            // Create Journal Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: selectedJournalType.isEmpty
                    ? null
                    : () {
                        if (selectedJournalType == "text") {
                          Navigator.pushNamed(context, '/jurnaltext');
                        } else if (selectedJournalType == "voice") {
                          Navigator.pushNamed(context, '/jurnalvoice');
                        }
                      },
                style: ElevatedButton.styleFrom(
                    backgroundColor: primary[90],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    disabledForegroundColor: Colors.white,
                    disabledBackgroundColor: primary[90]),
                child: const Text(
                  "Buat Jurnal",
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: "Nunito",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
