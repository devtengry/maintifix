import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:maintifix/constants/colors/project_colors.dart';
import 'package:maintifix/constants/fonts/project_fonts.dart';
import 'package:maintifix/constants/fonts/project_text_styles.dart';
import 'package:maintifix/screens/summary_screen.dart';
import 'package:maintifix/services/auth.dart';
import 'package:maintifix/widgets/login_widgets/login_button.dart';
import 'package:maintifix/widgets/login_widgets/reset_password_button.dart';
import 'package:maintifix/widgets/login_widgets/sign_up_button.dart';
import 'package:maintifix/widgets/login_widgets/text_fields.dart';

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

  Future<void> createUser() async {
    try {
      await Auth().createUser(
        email: emailController.text,
        password: passwordController.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Future<void> signIn() async {
    try {
      await Auth().signIn(
        email: emailController.text,
        password: passwordController.text,
      );

      // Eğer giriş başarılı olursa yönlendirme işlemi yapılır.
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SummaryScreen(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Hata mesajını göstermek için.
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    emailController = TextEditingController();
    passwordController = TextEditingController();

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
                      margin: const EdgeInsets.only(right: 270, bottom: 10),
                      child: Text(
                        'E-Mail',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    MailTextFieldsStyle(emailController: emailController)
                        .usernameTextField,
                    Container(
                      margin: const EdgeInsets.only(
                          right: 250, bottom: 10, top: 10),
                      child: Text(
                        'Password',
                        style: ProjectTextStyle.textFiledHeaderStyle,
                      ),
                    ),
                    PasswordTextFieldsStyle(
                            passwordController: passwordController)
                        .passwordTextField,
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                    ),

                    /// geçici************************************************************
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
                        onPressed: () {
                          if (isLogin) {
                            signIn();
                          } else {
                            createUser();
                          }
                        },
                        child: isLogin
                            ? Text(
                                'Login',
                                style: ProjectFonts().buttonFont,
                              )
                            : Text(
                                'Register',
                                style: ProjectFonts().buttonFont,
                              ),
                      ),
                    ),
                    errorMessage != null
                        ? Text(errorMessage!)
                        : const SizedBox.shrink(),

                    /// geçici************************************************************

                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        //RegisterButton(),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              isLogin = !isLogin; // Durumu değiştirir.
                            });
                          },
                          child: Text(
                            'Register',
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
