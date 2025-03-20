import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../assets/color.dart';

class EndSession extends StatelessWidget {
  const EndSession({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          double maxWidth = constraints.maxWidth > 700 ? 700 : constraints.maxWidth;
          return Center(
            child: SingleChildScrollView(
              child: Container(
                width: maxWidth, // Batasi lebar maksimal 700
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "lib/assets/images/hug.png",
                      width: maxWidth * 0.8,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Sesi Berakhir!",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: primaryBlack,
                        fontSize: 20, // Ukuran font sedikit lebih besar agar terbaca jelas
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Konsultasimu sudah berakhir, terimakasih telah menggunakan jasa kami. Semoga hari kamu bahagia",
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: primaryBlack),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: 173,
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
                          Navigator.pushReplacementNamed(context, '/main');
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Kembali"),
                            SizedBox(width: 8),
                            Icon(Icons.add, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
