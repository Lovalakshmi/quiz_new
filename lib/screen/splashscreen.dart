import 'dart:async';

import 'package:flutter/material.dart';

import 'loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// global varikables

  void initState() {
    super.initState();

    Timer(
        // property one
        Duration(seconds: 5),
        // two
        () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginScreen(),
        ),
      );
    });
  }

// global varikables

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image.asset(
        'assets/images/quiz logo.png',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
