import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:raion_intern_15/features/domain/entities/user.dart';
import 'package:raion_intern_15/features/presentation/provider/auth_provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.currentUser;

    if (user == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.fullName}", style: TextStyle(fontSize: 18)),
            Text("Email: ${user.email}", style: TextStyle(fontSize: 16)),
            Text("Bio: ${user.bio}", style: TextStyle(fontSize: 14)),
            if (user.role == UserRole.doctor)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("License: ${user.licenseNumber ?? '-'}"),
                  Text("Specialization: ${user.specialization ?? '-'}"),
                ],
              ),
            ElevatedButton(onPressed:() {Navigator.pushReplacementNamed(context, '/login');},
                child: Text("login"))
          ],
        ),
      ),
    );
  }
}
