import 'package:chat_app/utils/personTile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
        margin: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          //color: Colors.deepPurple,
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
              height: 20,
            ),

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
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.book),
        onPressed: () {},
        elevation: 0,
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}
