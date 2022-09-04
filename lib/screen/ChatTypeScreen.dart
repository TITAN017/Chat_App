import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/models/friendUser.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/shared/scrollGlowRemover.dart';
import 'package:chat_app/utils/chatTile.dart';
import 'package:chat_app/utils/chatTileList.dart';
import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

//ignore_for_file:prefer_const_constructors

class ChatTypeScreen extends StatefulWidget {
  final FriendUser friend;
  final CurrentUser user;
  ChatTypeScreen({required this.user, required this.friend}) {
    print('Friend is : ${friend.name} Entering');
  }

  @override
  State<ChatTypeScreen> createState() => _ChatTypeScreenState();
}

class _ChatTypeScreenState extends State<ChatTypeScreen> {
  late DatabaseChat dbc;
  @override
  void initState() {
    super.initState();
    dbc = DatabaseChat(user: widget.user, friend: widget.friend);
  }

  late int total = widget.friend.total;
  final TextEditingController controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> key = GlobalKey<FormState>();
    String info = '';
    return MultiProvider(
      providers: [
        StreamProvider<List<UserChat>>.value(
            value: dbc.userChats, initialData: []),
        StreamProvider<List<FriendChat>>.value(
            value: dbc.friendChats, initialData: []),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CustomColors.NAV_BAR_BACKGROUND_COLOR,
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 65,
          backgroundColor: CustomColors.DEFAULT_COLOR,
          actions: [
            IconButton(
              icon: Icon(Icons.video_call_outlined),
              //color: Colors.grey,
              onPressed: () {},
              iconSize: 27,
            ),
            IconButton(
              icon: Icon(Icons.call_outlined),
              //color: Colors.grey,
              onPressed: () {},
              iconSize: 27,
            ),
          ],
          foregroundColor: CustomColors.CHAT_APP_BAR_FOREGROUND_COLOR,
          leading: IconButton(
            icon: Icon(Icons.keyboard_return),
            onPressed: () {
              print('Friend is : ${widget.friend.name} leaving');
              Navigator.pop(context);
            },
          ),
          title: Row(
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.person_outlined,
                  color: Colors.grey,
                  size: 30,
                ),
                backgroundColor: Colors.grey[300],
                radius: 24,
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.acme(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    'Action...',
                    style: GoogleFonts.acme(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),

        //Body of Screen
        body: ScrollConfiguration(
          behavior: NoGlowScroll(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Body of Chat type Screen

                ChatTileList(),

                //Text Bar of Chat type Screen
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blueGrey[900]!,
                  ),
                  height: 80,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 300,
                        padding: CustomInsets.CHAT_TEXT_FIELD_PADDING,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: CustomColors.TEXT_BAR_COLOR,
                        ),
                        child: TextFormField(
                          controller: controller,
                          onChanged: (val) {
                            info = val;
                          },
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                              icon: Align(
                                child: Icon(Icons.send),
                                widthFactor: 1,
                                heightFactor: 2,
                              ),
                              iconSize: 30,
                              color: CustomColors.CHAT,
                              onPressed: () async {
                                if (info.isNotEmpty) {
                                  controller.clear();
                                  await dbc.addChat(
                                      UserChat(info: info, date: '9:12'),
                                      total + 1);
                                  total += 1;
                                }
                              },
                            ),
                            hintText: 'Type here...',
                            fillColor: CustomColors.NAV_BAR_COLOR,
                            hintStyle: GoogleFonts.acme(
                              letterSpacing: 1,
                              color: CustomColors.CHAT,
                            ),
                            border: InputBorder.none,
                          ),
                          cursorColor: CustomColors.NAV_BAR_COLOR,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: CustomInsets.CHAT_TEXT_FIELD_BORDER,
                          color: CustomColors.TEXT_BAR_COLOR,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add),
                          iconSize: 30,
                          color: CustomColors.CHAT,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
