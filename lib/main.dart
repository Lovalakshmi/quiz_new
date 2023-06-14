import 'package:flutter/material.dart';

import 'package:quiz_1/screen/splashscreen.dart';

void main() {
  runApp(QuizApp());
}

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: SplashScreen(),
    );
  }
}
