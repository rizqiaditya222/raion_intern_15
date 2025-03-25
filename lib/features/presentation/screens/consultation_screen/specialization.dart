import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';

import '../../provider/specialization_provider.dart';

class Specialization extends StatefulWidget {
  @override
  _SpecializationState createState() => _SpecializationState();
}

class _SpecializationState extends State<Specialization> {
  final List<Map<String, dynamic>> options = [
    {'icon': AssetImage(anxiety), 'activeIcon': AssetImage(anxiety_active), 'text': "Anxiety"},
    {'icon': AssetImage(depresi), 'activeIcon': AssetImage(depresi_active), 'text': "Depresi"},
    {'icon': AssetImage(adiksi), 'activeIcon': AssetImage(adiksi_active), 'text': "Adiksi"},
    {'icon': AssetImage(bipolar), 'activeIcon': AssetImage(bipolar_active), 'text': "Bipolar"},
    {'icon': AssetImage(hubungan), 'activeIcon': AssetImage(hubungan_active), 'text': "Hubungan"},
    {'icon': AssetImage(lgbt), 'activeIcon': AssetImage(lgbt_active), 'text': "LGBT"},
    {'icon': AssetImage(makan), 'activeIcon': AssetImage(makan_active), 'text': "Makan"},
    {'icon': AssetImage(skizo), 'activeIcon': AssetImage(skizo_active), 'text': "Skizo"},
    {'icon': AssetImage(tidur), 'activeIcon': AssetImage(tidur_active), 'text': "Tidur"},
    {'icon': AssetImage(anak), 'activeIcon': AssetImage(anak_active), 'text': "Anak"},
  ];

  @override
  Widget build(BuildContext context) {
    final specializationProvider = Provider.of<SpecializationProvider>(context);
    int _selectedIndex = options.indexWhere((element) => element['text'] == specializationProvider.selectedSpecialization);

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Text("Pilih Spesialisasi", style: Theme.of(context).textTheme.headlineLarge, textAlign: TextAlign.center),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  Text(
                    "Pilih Spesialisasi Psikolog Mau konsultasi dengan psikolog yang sesuai? Pilih spesialisasi yang paling cocok untukmu!",
                    style: TextStyle(color: Color(0xFF3D3B3B), fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Center(
                    child: SizedBox(
                      width: 350,
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: options.length,
                        itemBuilder: (context, index) {
                          bool isSelected = _selectedIndex == index;
                          return GestureDetector(
                            onTap: () {
                              specializationProvider.updateSpecialization(options[index]['text']);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: isSelected ? Color(0xFFF3BB06) : Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                    color: isSelected ? Color(0x40E3C896) : Color.fromARGB(255, 241, 241, 241),
                                    spreadRadius: 5,
                                    blurRadius: isSelected ? 0 : 10,
                                    offset: isSelected ? Offset(0, 0) : Offset(0, 5),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: isSelected ? Color(0xFFF5D161) : primary[90],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image(
                                      image: isSelected ? options[index]['activeIcon'] : options[index]['icon'],
                                      width: 40,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(width: 12),
                                  Text(
                                    options[index]['text'],
                                    style: TextStyle(
                                      color: isSelected ? Colors.white : Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  SizedBox(
                    width: double.infinity,
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
                        Navigator.pushReplacementNamed(context, '/search');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Cari Ahli", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                          SizedBox(width: 16),
                          Icon(Icons.search, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                    Navigator.pushReplacementNamed(context, "/main");
                  },
                  backgroundColor: Colors.white,
                  elevation: 0,
                  child: Icon(Icons.keyboard_arrow_left, color: primary[90], size: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}