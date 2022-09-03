import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/screen/ChatTypeScreen.dart';
import 'package:chat_app/screen/chatScreen.dart';
import 'package:chat_app/services/auth.dart';
import 'package:chat_app/services/database.dart';
import 'package:chat_app/utils/testing.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  //initialize the bindings in flutter (low level process)
  WidgetsFlutterBinding.ensureInitialized();

  //Initialize the firebase app
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Authenticate auth;
  bool theme = false;
  void darkLight() {
    setState(() {
      theme = !theme;
      print('toggled $theme');
    });
  }

  @override
  void initState() {
    super.initState();
    auth = Authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<CurrentUser>.value(
      value: auth.userID,
      initialData: CurrentUser(name: 'User_1'),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(brightness: theme ? Brightness.dark : Brightness.light),
        home: SafeArea(
          child: ChatScreen(
            toggle: darkLight,
            state: theme,
          ),
          //ChatTypeScreen(),
        ),
      ),
    );
  }
}

/* Add multiple providers for chat type screen to subscribe to 2 streams for chats
    Added user,friend parameter passing to chatTypeScreen*/
