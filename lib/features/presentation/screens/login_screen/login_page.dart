import 'package:flutter/material.dart';
import 'package:raion_intern_15/features/widgets/formField.dart';

import '../../../widgets/button.dart';


class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {

  final _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                FormFieldWidget(
                    inputType: TextInputType.emailAddress,
                    obscureText: false,
                    labelText: "Email",
                    icon: Icon(Icons.mail),
                    validator: (val) => val!.isEmpty ? 'Enter an email address' : null,
                ),
                FormFieldWidget(
                    obscureText: true,
                    labelText: "Password",
                    icon: Icon(Icons.lock),
                validator: (val) => val!.length < 8 ? 'Password must be at least 8 charachters' : null,),
                SubmitButton(myText: "Sign in"),
                SizedBox(height: 20,),
                GoogleButton(myText: "Login with Google")

              ],
            ),
          ))
    );
  }
}
