// ignore_for_file: prefer_const_constructors

import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  final String user;
  const ChatTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: CustomInsets.CHAT_TILE_ALIGNMENT[user]!,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.6,
        margin: EdgeInsets.only(top: 7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: CustomColors.CHAT_TILE_GRADIENT[user],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '${MediaQuery.of(context).size.width}',
          style: GoogleFonts.acme(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
