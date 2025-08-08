import 'package:flutter/material.dart';
import 'package:shopping_app/view/home_screen.dart';
import 'package:shopping_app/view/welcome_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.userName});
  final String? userName;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: userName == null ? WelcomeScreen() : HomeScreen(),
    );
  }
}
