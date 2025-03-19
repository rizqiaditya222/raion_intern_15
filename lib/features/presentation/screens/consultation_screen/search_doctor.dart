import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import '../../../../assets/widgets/rating.dart';
import '../../../domain/entities/doctor.dart';
import '../../../domain/repositorires/doctor_repository.dart';
import '../../provider/doctor_provider.dart';
import 'package:raion_intern_15/di/injection_container.dart' as di;
import 'package:raion_intern_15/assets/constants/image_strings.dart';

import '../../provider/specialization_provider.dart';

class SearchDoctor extends StatefulWidget {
  const SearchDoctor({super.key});

  @override
  State<SearchDoctor> createState() => _SearchDoctorState();
}

class _SearchDoctorState extends State<SearchDoctor> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
      final doctorRepo = di.sl<DoctorRepository>();
      doctorProvider.fetchAllDoctors(doctorRepo);
    });
  }

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final specializationProvider = Provider.of<SpecializationProvider>(context);
    final selectedSpecialization = specializationProvider.selectedSpecialization;
    final filteredDoctors = doctorProvider.doctors
        .where((doctor) => doctor.specialization == selectedSpecialization)
        .toList();

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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/specialization");
          },
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Cari dokter...",
                hintStyle: TextStyle(color: Colors.grey[400]),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Icon(Icons.search, size: 24, color: Colors.grey[600]),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey[300]!, width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.blueAccent, width: 2.5),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
              ),
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: doctorProvider.isLoading
                ? const Center(child: CircularProgressIndicator())
                : doctorProvider.errorMessage != null
                ? Center(child: Text(doctorProvider.errorMessage!))
                : filteredDoctors.isEmpty
                ? const Center(child: Text("Tidak ada dokter dengan spesialisasi ini"))
                : ListView.builder(
              itemCount: filteredDoctors.length,
              itemBuilder: (context, index) {
                final doctor = filteredDoctors[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildDoctorCard(doctor),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDoctorCard(Doctor doctor) {
    return GestureDetector(
      onTap: () {
        final doctorProvider = Provider.of<DoctorProvider>(context, listen: false);
        doctorProvider.setSelectedDoctor(doctor);
        Navigator.pushNamed(context, "/profile", arguments: doctor);
      },
      child: Container(
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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 115,
              width: 87,
              decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(doctorImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 24),
            SizedBox(
              height: 115,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(doctor.name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                  Row(
                    children: [
                      Image.asset(hospital, width: 20),
                      const SizedBox(width: 4),
                      Text(doctor.hospital, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      const SizedBox(width: 32),
                      Image.asset(map, width: 20),
                      const SizedBox(width: 4),
                      Text("${doctor.distance} km", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(depresi, width: 20),
                      const SizedBox(width: 4),
                      Text("Ahli ${doctor.specialization}", style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                    ],
                  ),
                  Row(
                    children: [
                      buildRatingStars(doctor.rating),
                      const SizedBox(width: 8),
                      Text(doctor.rating.toString(), style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16)),
                      const SizedBox(width: 8),
                      Container(
                        height: 4,
                        width: 4,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.grey),
                      ),
                      const SizedBox(width: 16),
                      Text("${doctor.ratingAmount}",
                          style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 16, color: Color(0xFF736B66))),
                    ],
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
