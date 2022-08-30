import 'package:chat_app/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Database {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection('Database');
  final CollectionReference userRef = FirebaseFirestore.instance
      .collection('Database')
      .doc('User_1')
      .collection('Friends');

  Stream<List<ChatUser>> get chatUsers {
    return userRef.snapshots().map(chatUserConvert);
  }

  List<ChatUser> chatUserConvert(QuerySnapshot s) {
    return s.docs
        .map(
          (doc) => ChatUser(
            username: doc.id,
            date: doc.get('last_msg'),
            unread: doc.get('unread'),
            active: () async {
              try {
                var data;
                await ref
                    .doc(doc.get('name'))
                    .get()
                    .then((value) => data = value.get('online'));
                return data;
              } catch (e) {
                print(e);
                return null;
              }
            }(),
          ),
        )
        .toList();
  }
}
