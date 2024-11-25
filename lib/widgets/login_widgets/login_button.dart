import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:maintifix/screens/summary_screen.dart';

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
