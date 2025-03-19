import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';

class JurnalScreen extends StatefulWidget {
  const JurnalScreen({super.key});

  @override
  State<JurnalScreen> createState() => _JurnalScreenState();
}

class _JurnalScreenState extends State<JurnalScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1D3557), // Dark blue background
      body: Stack(
        children: [
          Positioned(
            top: -80,
            left: 0,
            right: 30,
            child: Transform.scale(
              scale: 1.8, // Perbesar gambar 1.5x dari ukuran aslinya
              child: Image.asset(
                "lib/assets/images/jurnal/jurnaldetail.png",
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Main content
          Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: Text(
                  "Jurnal",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              const SizedBox(height: 30),
              Center(
                child: Container(
                  width: 120,
                  height: 120,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                "lib/assets/images/jurnal/jurnalcek.png",
                                width: 50,
                                height: 50,
                                fit: BoxFit.contain,
                              ),
                              SizedBox(width: 8),
                              Text(
                                "1",
                                style: TextStyle(
                                    fontSize: 48,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Nunito"),
                              ),
                            ],
                          ),
                        ),
                        Text(
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
              ),
            ],
          ),

          // White container at bottom
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.55, // Adjust height to match image
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
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
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Riwayat Jurnal",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primary[90],
                          fontFamily: "Nunito"),
                    ),
                    const SizedBox(height: 16),

                    // Recording card
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.play_arrow_rounded,
                                color: primary[90], size: 40),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Rekaman 1",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: primary[90],
                                      ),
                                    ),
                                    Icon(Icons.more_horiz, color: Colors.grey),
                                  ],
                                ),
                                SizedBox(height: 8),
                                Row(
                                  children: [
                                    Text(
                                      "01:32",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: primary[90],
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        margin:
                                            EdgeInsets.symmetric(horizontal: 8),
                                        height: 4,
                                        decoration: BoxDecoration(
                                          color: Colors.blue[800],
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "20:00",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: "Nunito",
                                        fontWeight: FontWeight.bold,
                                        color: primary[90],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Floating action button
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
                  color: Color(0xFF1D3557),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                    ),
                  ],
                ),
                child: Icon(Icons.add, color: Colors.white, size: 30),
              ),
            ),
          )
        ],
      ),
    );
  }
}
