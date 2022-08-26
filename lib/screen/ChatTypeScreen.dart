import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/utils/chatTile.dart';
import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//ignore_for_file:prefer_const_constructors

class ChatTypeScreen extends StatefulWidget {
  const ChatTypeScreen({Key? key}) : super(key: key);

  @override
  State<ChatTypeScreen> createState() => _ChatTypeScreenState();
}

class _ChatTypeScreenState extends State<ChatTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.NAV_BAR_BACKGROUND_COLOR,
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        backgroundColor: Colors.white,
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
          onPressed: () {},
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

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: CustomInsets.SCREEN_PADDING,
        decoration: BoxDecoration(
          color: CustomColors.CHAT_SCREEN_BACKGROUND_COLOR,
          borderRadius: CustomInsets.SCREEN_BORDER,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: const [
                  ChatTile(
                    user: 'Sender',
                  ),
                  ChatTile(
                    user: 'Receiver',
                  ),
                  ChatTile(
                    user: 'Sender',
                  ),
                  ChatTile(
                    user: 'Sender',
                  ),
                  ChatTile(
                    user: 'Receiver',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      //Bottom Navigation Bar (Text Bar)

      bottomNavigationBar: SingleChildScrollView(
        child: Container(
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
                  decoration: InputDecoration(
                    hintText: 'Type here...',
                    fillColor: CustomColors.NAV_BAR_COLOR,
                    hintStyle: GoogleFonts.acme(
                      letterSpacing: 1,
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}