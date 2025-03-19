import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';

class Consultation extends StatelessWidget {
  const Consultation({super.key});

  final int consultationCounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary[90],
        title: Text(
          "Konsultasi",
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.white, fontSize: 16),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/specialization");
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 241, 241, 241),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(28),
                    image: DecorationImage(
                      image: AssetImage(doctorImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                SizedBox(
                  height: 56,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("nama", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),

                      Row(
                        children: [
                          Image.asset(depresi, width: 20),
                          const SizedBox(width: 4),
                          Text("Ahli ${"doctor.specialization"}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.alarm),
                const SizedBox(width: 8),

                Text("doctor", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                const SizedBox(width: 16),
                Container(
                  height: 4,
                  width: 4,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                ),
                const SizedBox(width: 16),
                Icon(Icons.attach_money_outlined),
                Text("doctor", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//
// class EmptyConsultation extends StatelessWidget {
//   const EmptyConsultation({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(height: MediaQuery.of(context).size.height * 0.15),
//             Image.asset(emptyConsult),
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Belum Ada Janji Konsultasi, Nih!",
//                     style: Theme.of(context).textTheme.headlineMedium,
//                     textAlign: TextAlign.center,
//                   ),
//                   Text(
//                       "Sepertinya kamu belum bikin janji sama psikolog. Yuk, atur jadwal baru biar tetap merasa tenang dan didengar! ",
//                       style: Theme.of(context).textTheme.bodyLarge,
//                       textAlign: TextAlign.center),
//                   SizedBox(height: 30),
//                   SizedBox(
//                     width: 173,
//                     height: 56,
//                     child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           elevation: 0,
//                           backgroundColor: primary[90],
//                           foregroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pushReplacementNamed(context, '/specialization');
//                         },
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text("Buat Janji Baru"),
//                             SizedBox(
//                               width: 8,
//                             ),
//                             Icon(Icons.add, color: Colors.white,)
//                           ],
//                         )),
//                   ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.1),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
