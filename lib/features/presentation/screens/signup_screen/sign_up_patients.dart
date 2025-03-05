import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/button.dart';
import 'package:raion_intern_15/assets/widgets/formField.dart';
import 'package:raion_intern_15/features/presentation/screens/login_screen/welcome_section.dart';
import '../../provider/auth_provider.dart';


class RegisterCustomerScreen extends StatefulWidget {
  const RegisterCustomerScreen({Key? key}) : super(key: key);

  @override
  _RegisterCustomerScreenState createState() => _RegisterCustomerScreenState();
}

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Untuk validasi form
  bool _isLoading = false;

  @override
  void dispose() {
    // Membersihkan controller untuk menghindari memory leak
    _emailController.dispose();
    _passwordController.dispose();
    _fullNameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  WelcomeSection(
                    title: "Buat akun baru",
                     subtitle: "Buat akun dengan menggunakan email dan kata sandi",
                     hPadding: 40,),
                  FormFieldWidget(
                    controller: _fullNameController,
                    labelText: "Nama",
                    hintText: "Nama Lengkap",
                    obscureText: false,
                    icon: name,
                    validator: (value) =>
                    value == null || value.isEmpty ? "Nama tidak boleh kosong" : null,
                  ),
                 
                  FormFieldWidget(
                    controller: _emailController,
                    labelText: "Email",
                    hintText: "example@gmail.com",
                    obscureText: false,
                    icon: mail,
                    validator: (value) {
                      if (value == null || value.isEmpty) return "Email tidak boleh kosong";
                      if (!value.contains('@')) return "Masukkan email yang valid";
                      return null;
                    },
                  ),
                  FormFieldWidget(
                    controller: _passwordController,
                    labelText: "Password",
                    hintText: "Password",
                    obscureText: true,
                    icon: lock,
                    validator: (value) =>
                    value == null || value.length < 6 ? "Password minimal 6 karakter" : null,
                  ),
                  
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: SubmitButton(
                      myText: "Daftar", 
                      onPressed: _register),
                  ),
                  GoogleButton(
                    myText: "Masuk dengan Akun Google"),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: "Sudah punya akun?",
                              style: Theme.of(context).textTheme.bodyLarge),
                          TextSpan(
                            text: " Masuk",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {
                              Navigator.pushReplacementNamed(context, '/login');
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
    );
  }

  Future<void> _register() async {
  if (!_formKey.currentState!.validate()) return;

  setState(() {
    _isLoading = true;
  });

  final email = _emailController.text;
  final password = _passwordController.text;
  final fullName = _fullNameController.text;

  try {
    await Provider.of<AuthProvider>(context, listen: false)
        .registerAsCustomer(email, password, fullName, context);

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      _showSuccessDialog(); 
    }
  } catch (e) {
    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}

void _showSuccessDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("Registrasi Berhasil"),
        content: const Text("Akun Anda telah berhasil dibuat!"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Menutup dialog
            },
            child: const Text("OK"),
          ),
        ],
      );
    },
  );
}
}