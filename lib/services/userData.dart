import 'package:chat_app/models/currentUser.dart';
import 'package:flutter/material.dart';

class UserData extends InheritedWidget {
  final CurrentUser user;
  UserData({Key? key, required this.user, required Widget child})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(UserData oldWidget) => oldWidget.user != user;

  static CurrentUser of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<UserData>()!.user;
}
