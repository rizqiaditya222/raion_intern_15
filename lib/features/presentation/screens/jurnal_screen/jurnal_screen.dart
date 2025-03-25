import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../assets/color.dart';
import '../../../data/models/jurnal_model.dart';
import '../../provider/jurnal_provider.dart';
import 'jurnaltext.dart';

class JurnalScreen extends StatelessWidget {
  const JurnalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final journalProvider = Provider.of<JournalProvider>(context);
    final journalList = journalProvider.journalHistory;

    return Scaffold(
      backgroundColor: const Color(0xFF1D3557), // Dark blue background
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: 0,
            right: 30,
            child: Transform.scale(
              scale: 1.8, // Perbesar gambar 1.8x
              child: Image.asset(
                "lib/assets/images/jurnal/jurnaldetail.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  "Jurnal",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: "Nunito",
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "lib/assets/images/jurnal/jurnalcek.png",
                            width: 50,
                            height: 50,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "${journalList.length}",
                            style: const TextStyle(
                              fontSize: 48,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Nunito",
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        "Jurnal bulan ini",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontFamily: "Nunito",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(48),
                  topRight: Radius.circular(48),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Riwayat Jurnal",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primary[90],
                        fontFamily: "Nunito",
                      ),
                    ),
                    const SizedBox(height: 16),
                    Expanded(
                      child: ListView.builder(
                        itemCount: journalList.length,
                        itemBuilder: (context, index) {
                          JournalModel journal = journalList[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Jurnaltext(journal: journal),
                                ),
                              );
                            },
                            child: Card(
                              elevation: .5,
                              margin: const EdgeInsets.symmetric(vertical: 8),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              color: Color(0xFFe8ecf2),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                            Colors.black.withOpacity(0.1),
                                            blurRadius: 5,
                                          ),
                                        ],
                                      ),
                                      child: Icon(Icons.book,
                                          color: primary[90]),
                                    ),
                                    const SizedBox(width: 12),
                                    // Judul dan konten jurnal
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            journal.title,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontFamily: "Nunito",
                                              fontWeight: FontWeight.bold,
                                              color: primary[90],
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            journal.content,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            right: 24,
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/jurnalselect');
              },
              child: Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFF1D3557),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
