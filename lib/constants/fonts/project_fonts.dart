import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maintifix/constants/theme/project_colors.dart';

class ProjectFonts extends GoogleFonts {
  final headerFont = GoogleFonts.poppins(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: ProjectColors.textColor,
  );
  final paragraphFont = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
  final buttonFont = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: ProjectColors.textColor,
  );
  final cardHeaderFont = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w800,
    color: ProjectColors.textColor,
  );
  final cardFont = GoogleFonts.poppins(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: ProjectColors.textColor,
  );
}
