import 'package:flutter/material.dart';
import 'package:quiz_flutter/screens/login_screen.dart';

class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ICS Quiz',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (BuildContext context) => LoginScreen(),
      },
    );
  }
}
