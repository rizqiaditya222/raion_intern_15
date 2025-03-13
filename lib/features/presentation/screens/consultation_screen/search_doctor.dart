import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/onboarding_card.dart';

class SearchDoctor extends StatelessWidget {
  SearchDoctor({super.key});

  final TextEditingController controller = TextEditingController();

  final List<Map<String, dynamic>> doctorList = [
    {
      'icon': AssetImage("lib/assets/images/onBoard2.png"),
      'activeIcon': AssetImage(moodHappy),
      'name': "Anxiety",
      'hospital': "RSUB",
      'distance': "750 M",
      'specialization': "Depresi",
      'rating': "4.5",
      'ratingAmount': "1,2 rb"
    },
    {
      'icon': AssetImage("lib/assets/images/onBoard3.png"),
      'activeIcon': AssetImage(moodHappy),
      'name': "Anxiety",
      'hospital': "RSUB",
      'distance': "750 M",
      'specialization': "Depresi",
      'rating': "4.5",
      'ratingAmount': "1,2 rb"
    },    {
      'icon': AssetImage("lib/assets/images/onBoard3.png"),
      'activeIcon': AssetImage(moodHappy),
      'name': "Anxiety",
      'hospital': "RSUB",
      'distance': "750 M",
      'specialization': "Depresi",
      'rating': "4.5",
      'ratingAmount': "1,2 rb"
    },    {
      'icon': AssetImage("lib/assets/images/onBoard3.png"),
      'activeIcon': AssetImage(moodHappy),
      'name': "Anxiety",
      'hospital': "RSUB",
      'distance': "750 M",
      'specialization': "Depresi",
      'rating': "4.5",
      'ratingAmount': "1,2 rb"
    },    {
      'icon': AssetImage("lib/assets/images/onBoard3.png"),
      'activeIcon': AssetImage(moodHappy),
      'name': "Anxiety",
      'hospital': "RSUB",
      'distance': "750 M",
      'specialization': "Depresi",
      'rating': "4.5",
      'ratingAmount': "1,2 rb"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Cari Ahli",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.all(8),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Cari dokter...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixIcon: Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.search, size: 24, color: Colors.grey[600]),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey[300]!,
                    width: 2.0,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.blueAccent,
                    width: 2.5,
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: doctorList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        const BoxShadow(
                          color: Color.fromARGB(255, 241, 241, 241),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: 115,
                          width: 87,
                          child: Image(
                            image: doctorList[index]['icon'],
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: SizedBox(
                            height: 115,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(doctorList[index]['name'],
                                    style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                Row(
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(hospital),
                                        const SizedBox(width: 4),
                                        Text(doctorList[index]['hospital'],
                                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                      ],
                                    ),
                                    SizedBox(width: 32),
                                    Row(
                                      children: [
                                        Image.asset(map),
                                        const SizedBox(width: 4),
                                        Text(doctorList[index]['distance'],
                                            style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Image.asset(depresi),
                                    const SizedBox(width: 4),
                                    Text(doctorList[index]['specialization'],
                                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 108,
                                      child: Image.asset(
                                        "lib/assets/images/consultation/rating.png",
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Text(doctorList[index]['rating'],
                                        style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                                    SizedBox(width: 8),
                                    Container(
                                      height: 4,
                                      width: 4,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Text(doctorList[index]['ratingAmount'],
                                        style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF736B66))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
