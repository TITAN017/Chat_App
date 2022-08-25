import 'package:flutter/material.dart';

class CustomColors {
  //DEFAULT COLOR

  static Color DEFAULT_COLOR = Colors.white;
  //CHAT SECTION COLORS

  static Color CHAT = Colors.white;

  //SEARCH BAR COLORS

  //MESSAGES COLOR

  //FLOATING ACTION BUTTON COLORS

  static Color FLOAT_ACTION_BUTTON_COLOR = Colors.indigo[800]!;

  //NAVBAR COLORS
  static Color NAV_BAR_COLOR = Colors.white54;
  static Color NAV_BAR_TAB_BACKGROUND_COLOR =
      Colors.indigo[800]!.withOpacity(0.5);
  static Color NAV_BAR_ACTIVE_COLOR = Colors.white54;
  static Color NAV_BAR_RIPPLE_COLOR = Colors.blueGrey[700]!;
  static Color NAV_BAR_HOVER_COLOR = Colors.indigo[900]!;
  static Color NAV_BAR_BACKGROUND_COLOR = Colors.blueGrey[900]!;
  static Gradient NAV_BAR_GRADIENT = LinearGradient(
    colors: [
      Colors.indigo[800]!,
      Colors.indigo[700]!,
    ],
  );

  //TEXT BAR CHAT TYPE SCREEN

  static Color TEXT_BAR_COLOR = Colors.blueGrey[800]!;
}
