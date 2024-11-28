import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintifix/constants/colors/project_colors.dart';

class ProjectTextStyle extends GoogleFonts {
  static var loginHeaderStyle = GoogleFonts.poppins(
    color: ProjectColors.textColor,
    fontSize: 25,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.w900,
  );

  static var textFiledHeaderStyle = GoogleFonts.poppins(
    color: ProjectColors.textColor,
  );
  static var textFieldHintStyle = GoogleFonts.poppins(
    color: const Color.fromARGB(146, 220, 208, 191),
  );
  static var textFieldStyle = GoogleFonts.poppins(
    fontSize: 15,
    color: ProjectColors.textColor,
  );

  static var loginTextButtonStlyle = GoogleFonts.poppins(
    fontStyle: FontStyle.normal,
    color: ProjectColors.textColor,
  );
  static var appBarTextStyle = GoogleFonts.poppins(
      color: ProjectColors.textColor, fontWeight: FontWeight.bold);
}
