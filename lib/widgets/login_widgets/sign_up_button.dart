import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_text_styles.dart';

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
                      style: TextStyle(color: ProjectColors.textColor),
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
