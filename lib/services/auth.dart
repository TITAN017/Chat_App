import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Authenticate {
  final FirebaseAuth ref = FirebaseAuth.instance;
  static final CollectionReference datRef =
      FirebaseFirestore.instance.collection('Authentication');

  static CurrentUser convertUID(User? u) {
    if (u == null) {
      return CurrentUser(name: 'null');
    } else {
      return CurrentUser(name: u.uid);
    }
  }

  // Stream for the current user status
  Stream<CurrentUser> get userID {
    return ref.authStateChanges().map(convertUID);
  }

  //login method
  static Future login(String email, String password) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? u = user.user;
      await Database.ref.doc(convertUID(u).name).set({'online': true});
      return u;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //signin method
  static Future signin(String email, String password, String name) async {
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? u = user.user;
      CurrentUser currentuser = convertUID(u);
      Database.ref.doc(currentuser.name)
        ..set({'name': name, 'online': true})
        ..collection('Friends').doc('Friend_1');

      return currentuser;
    } catch (e) {
      print('signin error');
      return null;
    }
  }

  //signout method
  static Future signout(String? user) async {
    try {
      await FirebaseAuth.instance.signOut();
      await Database.ref.doc(user).set({'online': false});
    } catch (e) {
      print('signout error');
    }
  }
}
