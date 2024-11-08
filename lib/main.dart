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

class ListVieww extends StatefulWidget {
  const ListVieww({super.key});

  @override
  State<ListVieww> createState() => _ListViewwState();
}

class _ListViewwState extends State<ListVieww> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
