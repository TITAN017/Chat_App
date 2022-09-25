import 'package:chat_app/shared/colorTheme.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CustomFonts {
  //Authentication Fonts
  static TextStyle HEADER = GoogleFonts.pacifico(
    fontSize: 30,
    //fontWeight: FontWeight.bold,
  );

  static TextStyle FIELDS = GoogleFonts.shadowsIntoLight(
    fontSize: 22,
  );

  static TextStyle HINT_TEXT = GoogleFonts.comfortaa(
    fontSize: 12,
  );

  static TextStyle FORGOT_PWD = GoogleFonts.lobster(
      fontWeight: FontWeight.w200, color: CustomColors.CHAT);

  static TextStyle SUBMIT = GoogleFonts.squadaOne(
    color: CustomColors.DEFAULT_COLOR,
    fontSize: 18,
    letterSpacing: 1,
  );
}
