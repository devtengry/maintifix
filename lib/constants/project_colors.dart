import 'package:flutter/material.dart';

class ProjectColors extends Color {
  static const loginScreenContainerColor = Color.fromARGB(240, 26, 54, 54);
  static const loginTextFieldColor = Color.fromARGB(46, 103, 125, 106);
  static const loginScreenTextColor = Color.fromARGB(255, 220, 208, 191);
  static const buttonColor = Color.fromARGB(255, 63, 87, 72);
  static const floatingActionButtonColor = Color.fromARGB(255, 63, 87, 72);
  static const floatingIconColor = Color.fromARGB(255, 220, 208, 191);
  static const bottomNavBarColor = Color.fromARGB(255, 17, 40, 40);
  static const bottomNavIconColor = Color.fromARGB(255, 220, 208, 191);

  static const summaryAppBarColor = Color.fromARGB(255, 26, 54, 54);
  static const summaryScreenBackroundColor = Color.fromARGB(255, 64, 83, 76);

  ProjectColors(super.value);
}

class ProjectGradientColors extends LinearGradient {
  const ProjectGradientColors({required super.colors});

  static const loginScreenBackroundColor = LinearGradient(
    colors: [
      Color(0xFFD6BD98),
      Color(0xFF677D6A),
      Color(0xFF40534C),
      Color(0xFF1A3636)
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const summaryScreenBackroundColor = LinearGradient(
    colors: [Color(0xFF40534C), Color(0xFF1A3636)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
