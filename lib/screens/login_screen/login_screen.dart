import 'package:flutter/material.dart';

import '../../constants/fonts/project_fonts.dart';
import '../../constants/fonts/project_text_styles.dart';
import '../../constants/theme/project_colors.dart';
import '../../services/firebase/auth.dart';
import '../../widgets/inputs/text_fields.dart';
import '../../widgets/login_widgets/reset_password_button.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  String? errorMessage;
  bool isLogin = true;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> createUser() async {
    try {
      await Auth().createUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SummaryScreen()),
      );
    } on Exception catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SummaryScreen()),
      );
    } on Exception catch (e) {
      setState(() {
        errorMessage = e.toString();
      });
    }
  }

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(255, 22, 31, 45),
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
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Maintifix', style: ProjectTextStyle.loginHeaderStyle),
                    // Email Text Field
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'E-Mail',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    MailTextFieldsStyle(emailController: emailController)
                        .usernameTextField,
                    // Password Text Field
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        'Password',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    PasswordTextFieldsStyle(
                      passwordController: passwordController,
                    ).passwordTextField,
                    // Login/Register Button
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      width: 500,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(
                              ProjectColors.buttonColor),
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        onPressed: isLogin ? signIn : createUser,
                        child: Text(
                          isLogin ? 'Login' : 'Register',
                          style: ProjectFonts().buttonFont,
                        ),
                      ),
                    ),
                    if (errorMessage != null)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          errorMessage!,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    // Toggle Between Login and Register
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = !isLogin;
                            });
                          },
                          child: Text(
                            isLogin ? 'Register' : 'Login',
                            style: ProjectTextStyle.loginTextButtonStlyle,
                          ),
                        ),
                        const AboutUsButton(),
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
