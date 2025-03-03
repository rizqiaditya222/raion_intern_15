import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../widgets/formField.dart';
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
    return Scaffold(
      appBar: AppBar(title: const Text("Register as Customer")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              FormFieldWidget(
                controller: _fullNameController,
                labelText: "Full Name",
                obscureText: false,
                icon: Icon(Icons.person),
                validator: (value) =>
                value == null || value.isEmpty ? "Nama tidak boleh kosong" : null,
              ),
              FormFieldWidget(
                controller: _bioController,
                labelText: "Bio",
                obscureText: false,
                icon: Icon(Icons.info_outline),
                validator: (value) =>
                value == null || value.isEmpty ? "Bio tidak boleh kosong" : null,
              ),
              FormFieldWidget(
                controller: _emailController,
                labelText: "Email",
                obscureText: false,
                icon: Icon(Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) return "Email tidak boleh kosong";
                  if (!value.contains('@')) return "Masukkan email yang valid";
                  return null;
                },
              ),
              FormFieldWidget(
                controller: _passwordController,
                labelText: "Password",
                obscureText: true,
                icon: Icon(Icons.lock),
                validator: (value) =>
                value == null || value.length < 6 ? "Password minimal 6 karakter" : null,
              ),
              const SizedBox(height: 20),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: _register,
                child: const Text("Register as Customer"),
              ),
            ],
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
    final bio = _bioController.text;

    try {
      await Provider.of<AuthProvider>(context, listen: false)
          .registerAsCustomer(email, password, fullName, bio, context);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
