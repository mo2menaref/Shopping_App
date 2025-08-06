import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shopping/screens/home_screen.dart';
import 'package:shopping/screens/welcome_screen.dart';
import 'package:shopping/screens/auth/lock_screen.dart';
import 'package:shopping/screens/auth/sign_in_screen.dart';
import 'package:shopping/screens/auth/sign_up_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translation',
      fallbackLocale: Locale('en', 'US'),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Suwannaphum',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: WelcomeScreen(),
      routes: <String, WidgetBuilder>{
        'home': (BuildContext context) => const MyHomePage(title: ''),
        'lock': (BuildContext context) => const LockScreen(),
        'login': (BuildContext context) => const Login(),
        'signup': (BuildContext context) => const SignUpScreen(),
      },
    );
  }
}
