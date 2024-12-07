import 'package:flutter/material.dart';

import '../../constants/fonts/project_text_styles.dart';
import '../../constants/theme/project_colors.dart';

class AboutUsButton extends StatelessWidget {
  const AboutUsButton({super.key});

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
        'About Us',
        style: ProjectTextStyle.loginTextButtonStlyle,
      ),
    );
  }
}
