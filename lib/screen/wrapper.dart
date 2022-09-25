import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/screen/auth/signin.dart';
import 'package:chat_app/screen/home/chatScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'auth/login.dart';

class Wrapper extends StatefulWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool authToggle = true;

  void toggle() {
    setState(() {
      authToggle = !authToggle;
      print('done');
    });
  }

  bool theme = false;

  void darkLight() {
    setState(() {
      theme = !theme;
      print('toggled $theme');
    });
  }

  @override
  Widget build(BuildContext context) {
    CurrentUser user = Provider.of<CurrentUser>(context);
    print('username : ${user.name}');
    if (user.name == 'null') {
      return authToggle ? Login(toggle) : Signin(toggle);
    } else {
      return ChatScreen(toggle: darkLight, state: theme);
    }
  }
}
