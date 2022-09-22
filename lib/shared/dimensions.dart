import 'package:flutter/material.dart';

class CustomInsets {
  //SCREEN_DIMENSIONS

  static BorderRadius SCREEN_BORDER = const BorderRadius.only(
    bottomLeft: Radius.circular(45),
    bottomRight: Radius.circular(45),
  );
  static EdgeInsets SCREEN_PADDING = const EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 10,
  );
  static BorderRadius SIGNIN_BORDER_RADIUS = const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  //CHAT_TEXT_FIELD_DIMENSIONS

  static EdgeInsets CHAT_TEXT_FIELD_PADDING =
      const EdgeInsets.fromLTRB(15, 10, 15, 5);
  static BorderRadius CHAT_TEXT_FIELD_BORDER = BorderRadius.circular(30);

  //CHAT_TILE_ALIGNMENT
  static Map<String, AlignmentGeometry> CHAT_TILE_ALIGNMENT = {
    'Sender': Alignment.topRight,
    'Receiver': Alignment.topLeft,
  };
}
