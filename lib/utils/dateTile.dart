import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DateTile extends StatelessWidget {
  final String date;
  const DateTile({Key? key, required this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.deepPurple,
        ),
        child: Text(
          date,
          style: GoogleFonts.acme(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}
