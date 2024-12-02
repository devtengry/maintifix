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
      home: const TestComponent(),
      theme: ThemeData.light(),
      color: const Color.fromARGB(255, 36, 54, 66),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TestComponent extends StatelessWidget {
  const TestComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          /* Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 300,
                    width: 100,
                    color: Colors.amber,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    width: 100,
                    color: const Color.fromARGB(255, 7, 255, 23),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    width: 100,
                    color: const Color.fromARGB(255, 7, 52, 255),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300,
                    width: 100,
                    color: const Color.fromARGB(255, 255, 7, 210),
                  ),
                ),
              ],
            ),
          ), */

          Positioned(
              top: 100,
              child: Container(
                color: Colors.amber,
              )),
          Positioned.fill(
              top: 100,
              bottom: 500,
              left: 20,
              right: 20,
              child: Container(
                color: const Color.fromARGB(255, 200, 188, 152),
              )),
        ],
      ),
    );
  }
}
