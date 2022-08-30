import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Text(
          'This is a test',
          style: GoogleFonts.acme(),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.red,
        ),
      ),
    );
  }
}
