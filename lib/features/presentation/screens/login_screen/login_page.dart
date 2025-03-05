import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/color.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/features/presentation/provider/auth_provider.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/assets/widgets/formField.dart';
import 'package:raion_intern_15/features/presentation/screens/login_screen/welcome_section.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false; // Tambahkan state loading

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (!_formKey.currentState!.validate()) {
      return; // Tidak lanjut jika form tidak valid
    }

    setState(() {
      _isLoading = true; // Tampilkan loading indicator
    });

    try {
      await Provider.of<AuthProvider>(context, listen: false).login(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        context,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading =
            false; // Sembunyikan loading indicator setelah proses selesai
      });
    }
  }
@override
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Scaffold(
      body: SingleChildScrollView(
        child: Center( // Tambahkan Center agar Column tetap di tengah
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 600), // Batasi lebar maksimal 600
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  WelcomeSection(
                    title: "Selamat datang!",
                    subtitle: "Silakan login menggunakan email yang sudah terdaftar",
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        FormFieldWidget(
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          obscureText: false,
                          labelText: "Email",
                          hintText: "example@gmail.com",
                          icon: mail,
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an email address' : null,
                        ),
                        FormFieldWidget(
                          controller: _passwordController,
                          obscureText: true,
                          labelText: "Password",
                          hintText: "Password",
                          sizedBoxHeight: 0,
                          icon: lock,
                          validator: (val) => val!.length < 8
                              ? 'Password must be at least 8 characters'
                              : null,
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                              onPressed: () {}, child: Text("Lupa kata sandi?")),
                        ),
                        const SizedBox(height: 20),
                        _isLoading
                            ? const CircularProgressIndicator()
                            : SubmitButton(
                                myText: "Sign in",
                                onPressed: _handleLogin,
                              ),
                        const SizedBox(height: 20),
                        GoogleButton(myText: "Login with Google"),
                      ],
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Don't have an Account?",
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                            text: " Sign Up",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushReplacementNamed(context, '/registerPatient');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

}
