import 'package:flutter/material.dart';

class ProjectColors extends Color {
  static const containerColor = Color(0xFF1E293B);
  static const textFieldColor = Color.fromARGB(68, 100, 116, 139);
  static const textColor = Color(0xFFCBD5E1);
  static const buttonColor = Color.fromARGB(255, 45, 70, 104);
  static const iconColor = Color(0xFFCBD5E1);
  static const bottomNavBarColor = Color.fromARGB(176, 51, 65, 85);
  static const cardColor = Color.fromARGB(199, 30, 41, 59);
  static const appBarColor = Color.fromARGB(255, 51, 65, 85);
  static const summaryScreenBackroundColor = Color.fromARGB(255, 64, 83, 76);

  static var primaryTextColor;

  static var logoutButtonColor;

  ProjectColors(super.value);
}

class ProjectGradientColors extends LinearGradient {
  const ProjectGradientColors({required super.colors});

  static const loginScreenBackroundColor = LinearGradient(
    colors: [
      /*  Color(0xFFF8FAFC),
      Color(0xFFF1F5F9),
      Color(0xFFE2E8F0),
      Color(0xFFCBD5E1), 
      Color(0xFF94A3B8),*/
      Color(0xFF64748B),
      Color(0xFF475569),
      Color(0xFF334155),
      Color(0xFF1E293B),
      Color(0xFF0F172A),
      // Color(0xFF0B1120),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const cardGradient = LinearGradient(
    colors: [
      Color(0xFF64748B),
      Color(0xFF475569),
      Color(0xFF334155),
      Color(0xFF1E293B),
      Color(0xFF0F172A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const summaryScreenBackroundColor = LinearGradient(
    colors: [
      Color(0xFF64748B),
      Color(0xFF475569),
      Color(0xFF334155),
      Color(0xFF1E293B),
      Color(0xFF0F172A),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static var settingsScreenBackgroundColor;
}
