// ignore_for_file: prefer_const_constructors

import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  final String user;
  final String info;
  const ChatTile({required this.user, required this.info});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: CustomInsets.CHAT_TILE_ALIGNMENT[user]!,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
          minWidth: 0,
        ),
        child: Container(
          alignment: CustomInsets.CHAT_TILE_ALIGNMENT[user],
          //width: MediaQuery.of(context).size.width * 0.6,
          margin: EdgeInsets.only(top: 7),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            gradient: CustomColors.CHAT_TILE_GRADIENT[user],
            borderRadius: BorderRadius.circular(15),
          ),
          child: Text(
            info,
            style: GoogleFonts.acme(
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
