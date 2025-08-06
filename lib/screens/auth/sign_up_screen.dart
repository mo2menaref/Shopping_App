import 'package:flutter/material.dart';
import 'package:shopping/widgets/custom_button.dart';
import 'package:shopping/widgets/custom_text_field.dart';
import 'package:shopping/utils/validators.dart';
import 'package:shopping/utils/constants.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}



class _SignUpScreenState extends State<SignUpScreen> with TickerProviderStateMixin {

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize fade animation controller
    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:
      Form(
        key: formKey,
       child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Hero(
              tag: "locktag",
              child: Icon(Icons.lock, size: 50, color: Colors.brown),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: nameController,
                validator: Validators.validateName,
                decoration: Lockstyle.copyWith(hintText: 'Full Name'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: emailController,
                validator: Validators.validateEmail ,
                decoration: Lockstyle.copyWith(hintText: 'Email'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: passwordController,
                validator: Validators.validatePassword ,
                obscureText: true,
                decoration: Lockstyle.copyWith(hintText: 'Password'),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 50,
              width: 300,
              child: TextFormField(
                controller: confirmPasswordController,
                validator: Validators.validatePassword ,
                obscureText: true,
                decoration: Lockstyle.copyWith(hintText: 'Confirm Password'),
              ),
            ),
            SizedBox(height: 20),
            Hero(
              tag: "signuptag",
              child: ElevatedButton(
                style: welcome_style,
                onPressed: () {
                  if(formKey.currentState!.validate()&&passwordController.text==confirmPasswordController.text){
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SimpleDialog(
                          title: Text(
                            "Account Created successfully",
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
                child: Text("Sign up"),
              ),
            ),
          ],
        ),
    ),
      ),
    );
  }
}
