import 'package:chat_app/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  static final CollectionReference ref =
      FirebaseFirestore.instance.collection('Database');
  CollectionReference? userRef;

  Database(String user) {
    userRef = FirebaseFirestore.instance
        .collection('Database')
        .doc(user)
        .collection('Friends');
  }

  Stream<List<ChatUser>> get chatUsers {
    return userRef!.snapshots().map(chatUserConvert);
  }

  List<ChatUser> chatUserConvert(QuerySnapshot s) {
    return s.docs.map(
      (doc) {
        var data;
        return ChatUser(
          username: doc.get('name'),
          date: doc.get('last_msg'),
          pinned: doc.get('pinned'),
        );
      },
    ).toList();
  }
}
