// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/models/userModel.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/utils/personTile.dart';
import 'package:chat_app/utils/personTileList.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';

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
    final Database db = Database(Provider.of<CurrentUser>(context).name);
    final String? user = Provider.of<CurrentUser>(context).name;
    print('USER FROM PROVIDER IS : $user');
    return StreamProvider<List<ChatUser>>.value(
      value: db.chatUsers,
      initialData: [],
      child: Scaffold(
        backgroundColor: CustomColors.NAV_BAR_BACKGROUND_COLOR,
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
          padding: CustomInsets.SCREEN_PADDING,
          decoration: BoxDecoration(
            borderRadius: CustomInsets.SCREEN_BORDER,
            color: CustomColors.DEFAULT_COLOR,
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
                    color: CustomColors.CHAT,
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
                  borderRadius: BorderRadius.circular(8),
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

              PersonTileList(),
            ],
          ),
        ),

        //Message Icon Floating Button
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.book_outlined),
          onPressed: () async {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text("Signed Out!"),
                duration: Duration(seconds: 1),
                backgroundColor: Colors.deepOrange,
              ),
            );
            await Authenticate.signout();
          },
          elevation: 0,
          backgroundColor: CustomColors.FLOAT_ACTION_BUTTON_COLOR,
        ),

        //Bottom Navigation Bar (Google NavBar)

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: CustomColors.NAV_BAR_BACKGROUND_COLOR,
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
              color: CustomColors.NAV_BAR_COLOR,
              width: 1,
            ),
            tabBorderRadius: 150,
            backgroundColor: CustomColors.NAV_BAR_BACKGROUND_COLOR,
            color: CustomColors.NAV_BAR_COLOR,
            activeColor: CustomColors.NAV_BAR_ACTIVE_COLOR,
            rippleColor: CustomColors.NAV_BAR_RIPPLE_COLOR,
            hoverColor: CustomColors.NAV_BAR_HOVER_COLOR,
            tabBackgroundGradient: CustomColors.NAV_BAR_GRADIENT,
            tabBackgroundColor: CustomColors.NAV_BAR_TAB_BACKGROUND_COLOR,
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
      ),
    );
  }
}
