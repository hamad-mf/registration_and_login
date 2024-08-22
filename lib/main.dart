import 'package:flutter/material.dart';
import 'package:registration_and_login/View/Login%20Screen/login_screen.dart';
import 'package:registration_and_login/View/Registration%20Screen/registration_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegistrationScreen(),
    );
  }
}
