import 'package:flutter/material.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("lib/assets/images/consultation/success.png"),
              SizedBox(height: 32,),
              Text("Yeay! Pembayaran Berhasil!", style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(height: 32,),
              Text("Jadwal konsultasimu sudah dikonfirmasi. Siap-siap ngobrol dengan dokter!",
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32,),
              SubmitButton(
                  myText: "Kembali ke Beranda",
                  onPressed: (){
                    Navigator.pushReplacementNamed(context, "/end");
                  },
                  )
            ],
          ),
        ),
      ),
    );
  }
}
