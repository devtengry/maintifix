import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintifix/constants/project_colors.dart';
import 'package:maintifix/constants/project_fonts.dart';
import 'package:maintifix/constants/project_text_styles.dart';
import 'package:maintifix/screens/summary_screen.dart';

class TextFieldsStyle extends TextField {
  final usernameTextField = TextField(
    decoration: InputDecoration(
      hintText: 'Username',
      hintStyle: ProjectTextStyle.textFieldHintStyle,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide.none,
      ),
      prefixIcon: const Icon(
        Icons.person_outline,
        color: Color.fromARGB(73, 220, 208, 191),
      ),
      fillColor: ProjectColors.loginTextFieldColor,
      filled: true,
    ),
  );
  final passwordTextField = TextField(
    decoration: InputDecoration(
      hintText: 'Password',
      hintStyle: ProjectTextStyle.textFieldHintStyle,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        borderSide: BorderSide.none,
      ),
      prefixIcon: const Icon(
        Icons.key_outlined,
        color: Color.fromARGB(73, 220, 208, 191),
      ),
      fillColor: ProjectColors.loginTextFieldColor,
      filled: true,
    ),
  );

  TextFieldsStyle({super.key});
}

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 500,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              WidgetStateProperty.all<Color>(ProjectColors.buttonColor),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SummaryScreen()),
          );
        },
        child: Text(
          'Login',
          style: ProjectFonts().buttonFont,
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  const SignupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: const Color.fromARGB(255, 103, 144, 129),
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Closes the BottomSheet
                    },
                    child: const Text(
                      'Close',
                      style:
                          TextStyle(color: ProjectColors.loginScreenTextColor),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text(
        'Sign Up',
        style: ProjectTextStyle.loginTextButtonStlyle,
      ),
    );
  }
}

class ResetPasswordButton extends StatelessWidget {
  const ResetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: const Color.fromARGB(255, 103, 144, 129),
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20),
            ),
          ),
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context); // Closes the BottomSheet
                    },
                    child: const Text(
                      'Close',
                      style:
                          TextStyle(color: ProjectColors.loginScreenTextColor),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
      child: Text(
        'Reset Password',
        style: ProjectTextStyle.loginTextButtonStlyle,
      ),
    );
  }
}
