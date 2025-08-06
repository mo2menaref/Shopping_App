import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/screens/home_screen.dart';
import 'package:shopping/widgets/custom_button.dart';
import 'package:shopping/widgets/custom_text_field.dart';
import 'package:shopping/utils/validators.dart';
import 'package:shopping/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _fadeAnimation,
        builder: (context, child) {
          return Opacity(
            opacity: _fadeAnimation.value,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Hero(
                    tag: "locktag",
                    child: Icon(Icons.lock, size: 100, color: Colors.brown),
                  ),
                  SizedBox(height: 50),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: emailController,
                      validator: Validators.validateEmail,
                      decoration: Lockstyle.copyWith(hintText: tr('email')),
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      controller: passwordController,
                      validator: Validators.validatePassword,
                      obscureText: true,
                      decoration: Lockstyle.copyWith(hintText: tr('password')),
                    ),
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
                                title: Text(tr('login_message'),
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Suwannaphum',
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                children: [
                                  IconButton(
                                    onPressed: () {
                                    },
                                    icon: Icon(Icons.close),
                                  ),
                                ],
                              );
                            },
                          );
                          _fadeController.forward().then((_) {
                            Navigator.of(context).pushReplacement(
                              PageRouteBuilder(
                                pageBuilder:
                                    (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    ) {
                                  return MyHomePage(
                                    title: "Our Products",
                                  );
                                },
                                transitionDuration: Duration(
                                  milliseconds: 800,
                                ),
                                transitionsBuilder:
                                    (
                                    context,
                                    animation,
                                    secondaryAnimation,
                                    child,
                                    ) {
                                  return FadeTransition(
                                    opacity: animation,
                                    child: child,
                                  );
                                },
                              ),
                            );
                          });
                        }
                      },
                      child: Text(tr('login')),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
