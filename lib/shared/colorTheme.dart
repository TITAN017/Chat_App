// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class CustomColors {
  //DEFAULT COLOR

  static Color DEFAULT_COLOR = Colors.white;
  //CHAT SECTION COLORS

  static Color CHAT = Colors.grey;

  //SEARCH BAR COLORS

  //MESSAGES COLOR

  //FLOATING ACTION BUTTON COLORS

  static Color FLOAT_ACTION_BUTTON_COLOR = Colors.blue[900]!;

  //NAVBAR COLORS
  static Color NAV_BAR_COLOR = Colors.white54;
  static Color NAV_BAR_TAB_BACKGROUND_COLOR =
      Colors.indigo[800]!.withOpacity(0.5);
  static Color NAV_BAR_ACTIVE_COLOR = Colors.white54;
  static Color NAV_BAR_RIPPLE_COLOR = Colors.blueGrey[700]!;
  static Color NAV_BAR_HOVER_COLOR = Colors.indigo[900]!;
  static Color NAV_BAR_BACKGROUND_COLOR = Colors.blueGrey[900]!;
  static Gradient NAV_BAR_GRADIENT = const LinearGradient(
    colors: [
      Color(0xFF667eea),
      Color(0xFF764ba2),
    ],
  );

  //CHAT_APP_BAR_COLOR

  static Color CHAT_APP_BAR_FOREGROUND_COLOR = Colors.grey;

  //TEXT BAR CHAT TYPE SCREEN

  static Color TEXT_BAR_BACKGROUND_COLOR = Colors.blueGrey[900]!;
  static Color TEXT_BAR_COLOR = Colors.blueGrey[800]!;
  static LinearGradient TEX_BAR_GRADIENT = const LinearGradient(
    colors: [
      Color(0xFF667eea),
      Color(0xFF764ba2),
    ],
  );

  //CHAT_TILE_COLOR

  static Color CHAT_SCREEN_BACKGROUND_COLOR = Colors.grey[100]!;
  static Color CHAT_TILE_SENDER_COLOR = Colors.orange;
  static Color CHAT_TILE_RECEIVER_COLOR = Colors.green;
  static Map<String, LinearGradient> CHAT_TILE_GRADIENT = const {
    'Sender': LinearGradient(
      colors: [
        Color(0xFFf6d365),
        Color(0xFFfda085),
      ],
    ),
    'Receiver': LinearGradient(
      colors: [
        Color(0xFFd4fc79),
        Color(0xFF96e6a1),
      ],
    )
  };
}
