import 'package:flutter/material.dart';
import 'package:maintifix/screens/home_screen/home_screen.dart';
import 'package:maintifix/screens/login_screen/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:maintifix/screens/settings_screen/settings_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaintifixApp());
}

class MaintifixApp extends StatelessWidget {
  const MaintifixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      theme: ThemeData.light(),
      color: const Color.fromARGB(255, 36, 54, 66),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const SummaryScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
//test