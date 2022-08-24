import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables

class PersonTile extends StatelessWidget {
  const PersonTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[100],
      ),
      child:
          //Person_icon
          Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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

          //Person_information

          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Username',
                    style: GoogleFonts.acme(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 140,
                  ),
                  Text(
                    'Date',
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
                      'Recent Text, How are you ?!',
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
                        style:
                            GoogleFonts.acme(fontSize: 12, color: Colors.white),
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
    );
  }
}
