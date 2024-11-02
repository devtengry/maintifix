import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintifix/project_colors.dart';
import 'package:maintifix/project_fonts.dart';
import 'package:maintifix/project_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: ProjectColors.loginScreenBackroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: screenWidth * 0.85,
              height: screenHeight * 0.45,
              padding: const EdgeInsets.only(left: 10, right: 10),
              color: const Color.fromARGB(136, 57, 48, 83),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Login',
                    style: ProjectFonts().headerFont,
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 250, bottom: 10),
                    child: const Text(
                      'Username',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextFieldsStyle().usernameTextField,
                  Container(
                    margin:
                        const EdgeInsets.only(right: 250, bottom: 10, top: 10),
                    child: const Text(
                      'Username',
                      textAlign: TextAlign.start,
                    ),
                  ),
                  TextFieldsStyle().passwordTextField,
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                  ),
                  SizedBox(
                    height: 50,
                    width: 500,
                    child: ElevatedButton(
                      style: const ButtonStyle(),
                      onPressed: () {},
                      child: Text(
                        'Login',
                        style: ProjectFonts().paragraphFont,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
