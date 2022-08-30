import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PersonTileList extends StatelessWidget {
  const PersonTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChatUser> persons = Provider.of<List<ChatUser>>(context);
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
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PersonTile(
            username: "user_1",
            date: '9:52',
          );
        },
      ),
    );
  }
}
