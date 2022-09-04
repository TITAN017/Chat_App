import 'package:chat_app/models/currentUser.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate {
  final FirebaseAuth ref = FirebaseAuth.instance;
  static final CollectionReference datRef =
      FirebaseFirestore.instance.collection('Authentication');

  CurrentUser convertUID(User? u) {
    if (u == null) {
      return CurrentUser(name: 'User_1');
    } else {
      return CurrentUser(name: u.uid);
    }
  }

  Stream<CurrentUser> get userID {
    return ref.authStateChanges().map(convertUID);
  }
}
