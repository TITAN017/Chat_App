// ignore_for_file: prefer_const_constructors

import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/models/friendUser.dart';
import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/screen/ChatTypeScreen.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class PersonTile extends StatelessWidget {
  final ChatUser user;
  const PersonTile({required this.user});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatTypeScreen(
              user: Provider.of<CurrentUser>(context),
              friend: FriendUser(
                id: user.id,
                name: user.username,
                total: user.total,
              ),
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: CustomColors.CHAT_SCREEN_BACKGROUND_COLOR,
        ),
        child:
            //Person_icon
            Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const CircleAvatar(
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.black,
                  ),
                  radius: 30,
                  backgroundColor: Colors.black12,
                  //backgroundColor: Colors.black12,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 3, 3),
                  height: 12,
                  width: 12,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: CustomColors.ONLINE_INDICATOR_COLOR,
                  ),
                ),
              ],
            ),

            SizedBox(
              width: 15,
            ),

            //Person_information

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        user.username,
                        style: GoogleFonts.acme(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        user.date,
                        style: GoogleFonts.acme(
                          color: CustomColors.MESSAGE_TEXT_COLOR,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !user.typing
                            ? Text(
                                user.recentText.length > 30
                                    ? '${user.recentText.substring(0, 26)}...'
                                    : user.recentText,
                                style: GoogleFonts.acme(
                                  fontSize: 15,
                                  color: !user.typing
                                      ? CustomColors.MESSAGE_TEXT_COLOR
                                      : CustomColors.TYPING_COLOR,
                                ),
                              )
                            : RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Icon(
                                        Icons.edit,
                                        size: 20,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: SizedBox(
                                        width: 4,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '${user.username} is typing...',
                                      style: GoogleFonts.acme(
                                        fontSize: 15,
                                        color: Colors.blue[800],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                        user.unread != 0
                            ? CircleAvatar(
                                child: Text(
                                  '${user.unread}',
                                  style: GoogleFonts.acme(
                                      fontSize: 12, color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                                radius: 10,
                              )
                            : SizedBox.shrink(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
