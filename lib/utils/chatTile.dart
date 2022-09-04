// ignore_for_file: prefer_const_constructors

import 'package:chat_app/models/chat.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatelessWidget {
  final chat;
  const ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: CustomInsets.CHAT_TILE_ALIGNMENT[chat.type]!,
      child: Container(
        //alignment: CustomInsets.CHAT_TILE_ALIGNMENT[user],
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
          minWidth: MediaQuery.of(context).size.width * 0,
        ),
        //width: MediaQuery.of(context).size.width * 0.4,
        margin: EdgeInsets.only(top: 7),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          gradient: CustomColors.CHAT_TILE_GRADIENT[chat.type],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          chat.info,
          style: GoogleFonts.acme(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
