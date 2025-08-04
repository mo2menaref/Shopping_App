import 'package:flutter/material.dart';
import 'package:shopping/widgets/custom_button.dart';
import 'package:shopping/widgets/custom_text_field.dart';
import 'package:shopping/utils/validators.dart';
import 'package:shopping/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Hero(
              tag: "locktag",
              child: Icon(Icons.lock, size: 100, color: Colors.brown),
            ),
            SizedBox(height: 50),
            TextFormField(
              controller: emailController,
              validator: Validators.validateEmail,
              decoration: Lockstyle.copyWith(hintText: 'Email'),
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              validator: Validators.validatePassword,
              obscureText: true,
              decoration: Lockstyle.copyWith(hintText: 'Password'),
            ),
            SizedBox(height: 20),
            Hero(
              tag: "logintag",
              child: ElevatedButton(
                style: welcome_style,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text(
                            "Account Login successfully",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Suwannaphum',
                            ),
                            textAlign: TextAlign.center,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          children: [
                            IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'home');
                              },
                              icon: Icon(Icons.close),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text("Log in"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
