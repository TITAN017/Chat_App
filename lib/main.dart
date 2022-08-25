import 'package:chat_app/screen/ChatTypeScreen.dart';
import 'package:chat_app/screen/chatScreen.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool theme = false;
  void darkLight() {
    setState(() {
      theme = !theme;
      print('toggled $theme');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: theme ? Brightness.dark : Brightness.light),
      home: SafeArea(
        child: /*ChatScreen(
          toggle: darkLight,
          state: theme,
        ),*/
            ChatTypeScreen(),
      ),
    );
  }
}

//Group all the colors
//
