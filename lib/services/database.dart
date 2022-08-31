import 'package:chat_app/models/currentUser.dart';
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
        print('document id is : ${doc.id}');
        var data;
        return ChatUser(
          username: doc.get('name'),
          date: doc.get('last_msg'),
          pinned: doc.get('pinned'),
          typing: doc.get('typing'),
          recentText: doc.get('msg'),
          unread: doc.get('unread'),
        );
      },
    ).toList();
  }
}

class DatabaseChat {
  final CurrentUser user;
  final String friend;
  late CollectionReference userChat;
  late CollectionReference friendChat;
  DatabaseChat({required this.user, required this.friend}) {
    userChat = FirebaseFirestore.instance
        .collection('Database')
        .doc(user.name!)
        .collection('Friends')
        .doc(friend)
        .collection('Chats');

    () async {
      var data = await FirebaseFirestore.instance
          .collection('Database')
          .doc(user.name!)
          .collection('Friends')
          .doc(friend)
          .get();
      String friendName = data.data()!['name'];

      friendChat = FirebaseFirestore.instance
          .collection('Database')
          .doc(friendName)
          .collection('Friends')
          .doc(user.name!)
          .collection('Chats');
    }();
  }
}
