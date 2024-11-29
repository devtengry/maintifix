import 'package:flutter/material.dart';
import 'package:maintifix/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maintifix/screens/summary_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SummaryScreen(),
      theme: ThemeData.dark(),
      color: const Color.fromARGB(255, 36, 54, 66),
      debugShowCheckedModeBanner: false,
    );
  }
}
