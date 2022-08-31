// ignore_for_file: prefer_const_constructors

import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PersonTileList extends StatelessWidget {
  const PersonTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChatUser> persons = Provider.of(context);
    List<ChatUser> pinnedPersons = [];
    List<ChatUser> notPinnedPersons = [];
    persons.forEach((element) {
      print(
          'Inside Person Tile List: $element ${persons[0].username} ${persons[1].username}');
      element.pinned
          ? pinnedPersons.add(element)
          : notPinnedPersons.add(element);
    });
    return Expanded(
      child: ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.pin_drop,
                color: Colors.black38,
              ),
              SizedBox(width: 15),
              Text(
                'Pinned Message',
                style: GoogleFonts.acme(
                  fontSize: 15,
                  color: Colors.black26,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          //Space between search bar and pinned msgs
          SizedBox(
            height: 20,
          ),
          //Pinned msgs
          ...pinnedPersons.map((user) => PersonTile(user: user)).toList(),

          SizedBox(
            height: 10,
          ),

          //All Messages..
          Row(
            children: [
              Icon(
                Icons.message,
                color: Colors.black38,
              ),
              SizedBox(width: 15),
              Text(
                'All Message',
                style: GoogleFonts.acme(
                  fontSize: 15,
                  color: Colors.black26,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),

          ...notPinnedPersons.map((user) => PersonTile(user: user)).toList(),
        ],
      ),
    );
  }
}
