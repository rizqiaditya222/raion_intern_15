
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/assets/constants/image_strings.dart';
import 'package:raion_intern_15/assets/widgets/formField.dart';
import '../../provider/auth_provider.dart'; 

class RegisterDoctorScreen extends StatefulWidget {
  const RegisterDoctorScreen({Key? key}) : super(key: key);

  @override
  _RegisterDoctorScreenState createState() => _RegisterDoctorScreenState();
}

class _RegisterDoctorScreenState extends State<RegisterDoctorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _bioController = TextEditingController();
  final _licenseController = TextEditingController();
  final _specializationController = TextEditingController();
  bool _isLoading = false;

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) {
      return; // Tidak lanjut jika form tidak valid
    }

    setState(() {
      _isLoading = true;
    });

    try {
      await Provider.of<AuthProvider>(context, listen: false).registerAsDoctor(
        _emailController.text,
        _passwordController.text,
        _fullNameController.text,
        _bioController.text,
        _licenseController.text,
        _specializationController.text,
        context,
      );
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register as Doctor")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                FormFieldWidget(
                  controller: _fullNameController,
                  inputType: TextInputType.text,
                  obscureText: false,
                  labelText: "Full Name",
                hintText: "Password",
                  icon: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Full Name is required";
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: _bioController,
                  inputType: TextInputType.text,
                  obscureText: false,
                  labelText: "Bio",
                hintText: "Password",
                  icon: name,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Bio is required";
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: _emailController,
                  inputType: TextInputType.emailAddress,
                  obscureText: false,
                  labelText: "Email",
                hintText: "Password",
                  icon: mail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Email is required";
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return "Enter a valid email";
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: _passwordController,
                  inputType: TextInputType.text,
                  obscureText: true,
                  labelText: "Password",
                hintText: "Password",
                  icon: lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    if (value.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: _licenseController,
                  inputType: TextInputType.text,
                hintText: "Password",
                  obscureText: false,
                  labelText: "License Number",
                  icon: lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "License Number is required";
                    }
                    return null;
                  },
                ),
                FormFieldWidget(
                  controller: _specializationController,
                  inputType: TextInputType.text,
                hintText: "Password",
                  obscureText: false,
                  labelText: "Specialization",
                  icon: lock,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Specialization is required";
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _register,
                  child: const Text("Register as Doctor"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
