import 'package:flutter/material.dart';
import 'package:maintifix/constants/project_colors.dart';
import 'package:maintifix/constants/project_text_styles.dart';
import 'package:maintifix/widgets/project_widgets.dart';

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

    return Container(
      decoration: const BoxDecoration(
        gradient: ProjectGradientColors.loginScreenBackroundColor,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(134, 13, 26, 9),
                      spreadRadius: 2,
                      blurRadius: 15,
                      offset: Offset(10, 20),
                      blurStyle: BlurStyle.normal,
                    )
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: ProjectColors.containerColor,
                ),
                width: screenWidth * 0.90,
                height: screenHeight * 0.50,
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Maintifix',
                      style: ProjectTextStyle.loginHeaderStyle,
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 250, bottom: 10),
                      child: Text(
                        'Username',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    TextFieldsStyle().usernameTextField,
                    Container(
                      margin: const EdgeInsets.only(
                          right: 250, bottom: 10, top: 10),
                      child: Text(
                        'Password',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    TextFieldsStyle().passwordTextField,
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),
                    const LoginButton(),
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SignupButton(),
                        ResetPasswordButton(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
