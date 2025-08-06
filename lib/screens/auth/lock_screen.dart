import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/widgets/custom_button.dart';

class LockScreen extends StatefulWidget {
  const LockScreen({super.key});

  @override
  State<LockScreen> createState() => _LockScreenState();
}

class _LockScreenState extends State<LockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "locktag",
              child: Icon(Icons.lock, size: 150, color: Colors.brown),
            ),
            SizedBox(height: 70),
            Hero(
              tag: "logintag",
              child: ElevatedButton(
                style: welcome_style,
                onPressed: () {
                  Navigator.pushNamed(context, 'login');
                },
                child: Text(tr('login')),
              ),
            ),
            SizedBox(height: 10),
            Hero(
              tag: "signuptag",
              child: ElevatedButton(
                style: welcome_style,
                onPressed: () {
                  Navigator.pushNamed(context, 'signup');
                },
                child: Text(tr('signup')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
