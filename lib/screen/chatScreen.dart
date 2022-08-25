// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//ignore_for_file:prefer_const_constructors

class ChatScreen extends StatefulWidget {
  final Function toggle;
  final bool state;

  ChatScreen({required this.toggle, required this.state});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  //final TextEditingController field = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      //App Bar for actions
      /*appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: state
                ? const Icon(Icons.light_mode)
                : const Icon(Icons.dark_mode),
            onPressed: () {
              toggle();
            },
          ),
          /*IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),*/
        ],
      ),*/

      body:
          //Search Bar
          Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        /*margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),*/
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(45),
            bottomRight: Radius.circular(45),
          ),
          color: Colors.white,
        ),
        child: Column(
          children: [
            //Chats and ... section

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Chats',
                  style: GoogleFonts.acme(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(
              height: 20,
            ),

            //Search Bar
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                //borderRadius: BorderRadius.circular(10),
              ),
              //color: Colors.black38,
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  focusColor: Colors.black,
                  icon: Icon(
                    Icons.search,
                    color: Colors.black38,
                    size: 30,
                  ),
                  hintText: 'Search...',
                ),
                //controller: field,
                onChanged: (val) {},
                style: GoogleFonts.acme(
                  fontSize: 18,
                ),
              ),
            ),

            //Person_chat_profile
            SizedBox(
              height: 20,
            ),

            Expanded(
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PersonTile(),
                  PersonTile(),
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
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PersonTile(),
                  PersonTile(),
                ],
              ),
            ),
          ],
        ),
      ),

      //Message Icon Floating Button
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {},
        elevation: 0,
        backgroundColor: Colors.indigo[800],
      ),

      //Bottom Navigation Bar (Google NavBar)

      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey[900]!,
        ),
        height: 80,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 10,
        ),
        child: GNav(
          padding: EdgeInsets.all(10),
          gap: 8,
          tabActiveBorder: Border.all(
            color: Colors.white54,
            width: 1,
          ),
          tabBorderRadius: 150,
          backgroundColor: Colors.blueGrey[900]!,
          color: Colors.white54,
          activeColor: Colors.white54,
          rippleColor: Colors.blueGrey[700]!,
          hoverColor: Colors.indigo[900]!,
          tabBackgroundGradient: LinearGradient(
            colors: [
              Colors.indigo[800]!,
              Colors.indigo[700]!,
            ],
          ),
          tabBackgroundColor: Colors.indigo[800]!.withOpacity(0.5),
          curve: Curves.easeInOutCirc,
          tabs: [
            GButton(
              icon: Icons.home_outlined,
              text: 'Home',
              style: GnavStyle.oldSchool,
            ),
            GButton(
              icon: Icons.message_outlined,
              text: 'Messages',
              style: GnavStyle.oldSchool,
            ),
            GButton(
              icon: Icons.settings_outlined,
              text: 'Settings',
              style: GnavStyle.oldSchool,
            ),
          ],
        ),
      ),
    );
  }
}
