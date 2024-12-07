import 'package:flutter/material.dart';

import '../../constants/fonts/project_text_styles.dart';
import '../../constants/theme/project_colors.dart';

class MailTextFieldsStyle {
  final TextEditingController emailController;

  late final TextField usernameTextField;

  MailTextFieldsStyle({
    required this.emailController,
  }) {
    usernameTextField = TextField(
      controller: emailController,
      style: ProjectTextStyle.textFieldStyle,
      decoration: InputDecoration(
        hintText: 'E-Mail',
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
  }
}

//test
class PasswordTextFieldsStyle {
  final TextEditingController passwordController;

  late final TextField passwordTextField;

  PasswordTextFieldsStyle({
    required this.passwordController,
  }) {
    passwordTextField = TextField(
      controller: passwordController,
      style: ProjectTextStyle.textFieldStyle,
      obscureText: true,
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
  }
}

class NameTextFieldsStyle {
  late final TextField nameTextField;

  NameTextFieldsStyle() {
    nameTextField = TextField(
      style: ProjectTextStyle.textFieldStyle,
      obscureText: true,
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
  }
}

class ClassName {}
