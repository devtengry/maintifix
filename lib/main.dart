import 'package:flutter/material.dart';
import 'package:maintifix/screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: ThemeData.dark(),
      color: const Color.fromARGB(255, 36, 54, 66),
      debugShowCheckedModeBanner: false,
    );
  }
}
