import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import '../../../../assets/constants/image_strings.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    // Data untuk pendekatan terapi
    final List<Map<String, String>> terapiList = [
      {
        "title": "Pendekatan Terapi Kognitif-Perilaku",
        "description": "Menerapkan Terapi Kognitif-Perilaku (CBT) untuk membantu pasien mengatasi pola pikir negatif"
      },
      {
        "title": "Pendekatan Terapi Berbasis Mindfulness",
        "description": "Menggunakan teknik mindfulness untuk meningkatkan kesadaran dan kesejahteraan emosional pasien"
      },
      {
        "title": "Terapi Berbasis Solusi",
        "description": "Fokus pada solusi praktis untuk membantu pasien mengatasi tantangan dalam kehidupan sehari-hari"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey[200], // Latar belakang aplikasi
      body: SingleChildScrollView(
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
                    doctor,
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
                      color: primary[90], // Warna biru gelap
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
                          "dr. Arumi Dewi M.Psi., Psikolog",
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
                            Text("4.5", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 16),
                            Icon(Icons.location_on, color: Colors.white, size: 20),
                            SizedBox(width: 4),
                            Text("750 m", style: TextStyle(color: Colors.white)),
                            SizedBox(width: 16),
                            Icon(Icons.psychology, color: Colors.white, size: 20),
                            SizedBox(width: 4),
                            Text("Psikolog", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 64),

            // Konten Biografi dan Pendekatan Terapi
            Padding(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Biografi singkat",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "dr. Arumi Dewi, M.Psi., Psikolog adalah seorang profesional di bidang psikologi yang berdedikasi dan penuh empati dalam membantu individu menghadapi tantangan kesehatan mental. Dengan pengalaman bertahun-tahun dalam menangani kasus depresi, ia menggabungkan keahlian dan pendekatan personal untuk memberikan solusi yang komprehensif.",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Pendekatan Terapi",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 16),

                  // Generate List of Therapy Approaches
                  Column(
                    children: List.generate(terapiList.length, (index) {
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
                                  terapiList[index]["title"]!,
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),
                                ),
                                Text(
                                  terapiList[index]["description"]!,
                                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),
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
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 16),
                      ),
                      Text(
                        "Lihat semua",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 14),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Bagian Rating dan Chart
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 108,
                          width: 108,
                          decoration: BoxDecoration(
                            color: Color(0x8AE8B64C), // Warna dengan opacity
                            borderRadius: BorderRadius.circular(54),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "4.8",
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  fontSize: 48,
                                  color: Colors.white,
                                  height: 0.9,
                                ),
                              ),
                              Text(
                                "1.2rb",
                                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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

                  // Tombol Konsultasi
                  SubmitButton(
                    myText: "Konsultasi",
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/step');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
