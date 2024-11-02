import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFieldsStyle extends TextField {
  final usernameTextField = TextField(
    decoration: InputDecoration(
      hintText: 'Username',
      hintStyle: GoogleFonts.albertSans(
        color: const Color.fromARGB(127, 255, 255, 255),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      fillColor: const Color.fromARGB(255, 24, 18, 43),
      filled: true,
    ),
  );
  final passwordTextField = TextField(
    decoration: InputDecoration(
      hintText: 'Password',
      hintStyle: GoogleFonts.albertSans(
        color: const Color.fromARGB(127, 255, 255, 255),
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      fillColor: const Color.fromARGB(255, 24, 18, 43),
      filled: true,
    ),
  );
}
