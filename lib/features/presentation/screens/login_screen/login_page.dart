import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/presentation/provider/auth_provider.dart';
import 'package:raion_intern_15/features/widgets/button.dart';
import 'package:raion_intern_15/features/widgets/formField.dart';
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
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              FormFieldWidget(
                controller: _emailController, // Menambahkan controller
                inputType: TextInputType.emailAddress,
                obscureText: false,
                labelText: "Email",
                icon: Icon(Icons.mail),
                validator: (val) =>
                    val!.isEmpty ? 'Enter an email address' : null,
              ),
              FormFieldWidget(
                controller: _passwordController, // Menambahkan controller
                obscureText: true,
                labelText: "Password",
                icon: Icon(Icons.lock),
                validator: (val) => val!.length < 8
                    ? 'Password must be at least 8 characters'
                    : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator() // Tampilkan loading saat proses login
                  : SubmitButton(
                      myText: "Sign in",
                      onPressed:
                          _handleLogin, // Langsung referensikan tanpa `()`
                    ),
              const SizedBox(height: 20),
              GoogleButton(myText: "Login with Google"),
            ],
          ),
        ),
      ),
    );
  }
}
