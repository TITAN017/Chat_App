import 'package:chat_app/screen/ChatTypeScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class PersonTile extends StatelessWidget {
  final String username;
  final String date;
  const PersonTile({required this.username, required this.date});

  @override
  Widget build(BuildContext context) {
    String text = 'Hey there, This is recent text...';
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChatTypeScreen()),
        );
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[100],
        ),
        child:
            //Person_icon
            Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    color: Colors.green,
                  ),
                ),
              ],
            ),

            //Person_information

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      username,
                      style: GoogleFonts.acme(
                        fontSize: 21,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 140,
                    ),
                    Text(
                      date,
                      style: GoogleFonts.acme(
                        color: Colors.black12,
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
                      Text(
                        text.length > 30 ? '${text.substring(0, 26)}...' : text,
                        style: GoogleFonts.acme(
                          fontSize: 15,
                          color: Colors.black12,
                        ),
                      ),
                      const SizedBox(
                        width: 70,
                      ),
                      CircleAvatar(
                        child: Text(
                          '1',
                          style: GoogleFonts.acme(
                              fontSize: 12, color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                        radius: 10,
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
