import 'package:flutter/material.dart';
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
      fillColor: ProjectColors.textFieldColor,
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
      fillColor: ProjectColors.textFieldColor,
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
        'Reset Password',
        style: ProjectTextStyle.loginTextButtonStlyle,
      ),
    );
  }
}

class FloatingButton extends StatelessWidget {
  const FloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ProjectColors.buttonColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        side: BorderSide(
          color: ProjectColors.buttonColor,
          width: 0.5,
        ),
      ),
      child: const Icon(
        Icons.add_to_photos_sharp,
        color: ProjectColors.iconColor,
        size: 30,
      ),
      onPressed: () {},
    );
  }
}

class BottomAppBarFloating extends StatelessWidget {
  const BottomAppBarFloating({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: ProjectColors.bottomNavBarColor,
      ),
      margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
      child: BottomAppBar(
        notchMargin: 2.0,
        padding: const EdgeInsets.only(right: 50, left: 50),
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.car_repair,
                  color: ProjectColors.iconColor,
                  size: 25,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  color: ProjectColors.iconColor,
                  size: 25,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProjectAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const String appBarText = 'Here it is...';

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      title: Text(
        appBarText,
        style: ProjectTextStyle.appBarTextStyle,
      ),
      backgroundColor: ProjectColors.appBarColor,
      toolbarHeight: 100,
      actions: [
        IconButton(
          onPressed: () {
            // Action when the icon is pressed
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 28,
          ),
          color: ProjectColors.textColor,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80); // Height of the AppBar
}
