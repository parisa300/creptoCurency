import 'package:creptoapp/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


Padding chartSortWidget(String str, bool isSelected, ThemeData themeData) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 1),
    child: Container(
      decoration: BoxDecoration(
          color: isSelected
              ? themeData.secondaryHeaderColor
              : themeData.primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 1,
          horizontal: 5,
        ),
        child: Center(
          child: Text(
            str,
            style: GoogleFonts.lato(
              color: isSelected
                  ? BaseColors.white
                  : themeData.primaryColor.withOpacity(0.7),
              fontWeight: FontWeight.bold,
              fontSize: 13,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    ),
  );
}
