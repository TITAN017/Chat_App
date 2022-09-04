import 'package:chat_app/models/chat.dart';
import 'package:chat_app/models/currentUser.dart';
import 'package:chat_app/models/friendUser.dart';
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
          id: doc.id,
          username: doc.get('name') ?? 'error',
          date: doc.get('last_msg') ?? 'error',
          pinned: doc.get('pinned') ?? false,
          typing: doc.get('typing') ?? false,
          recentText: doc.get('msg') ?? 'error',
          unread: doc.get('unread') ?? 0,
          total: doc.get('total') ?? 0,
        );
      },
    ).toList();
  }
}

class DatabaseChat {
  final CurrentUser user;
  final FriendUser friend;
  late CollectionReference userChat;
  late CollectionReference friendChat;
  DatabaseChat({required this.user, required this.friend}) {
    userChat = Database.ref
        .doc(user.name)
        .collection('Friends')
        .doc(friend.id)
        .collection('Chats');

    friendChat = Database.ref
        .doc(friend.id)
        .collection('Friends')
        .doc(user.name)
        .collection('Chats');
  }

  Stream<List<UserChat>> get userChats {
    return userChat.snapshots().map(
      (s) {
        return convertUserChat(s, 'Sender');
      },
    );
  }

  Stream<List<FriendChat>> get friendChats {
    return friendChat.snapshots().map(
      (s) {
        return convertFriendChat(s, 'Receiver');
      },
    );
  }

  List<UserChat> convertUserChat(QuerySnapshot s, String type) {
    return s.docs.map(
      (doc) {
        return UserChat(
          type: type,
          info: doc.get('info'),
          date: doc.get('date'),
        );
      },
    ).toList();
  }

  List<FriendChat> convertFriendChat(QuerySnapshot s, String type) {
    return s.docs.map(
      (doc) {
        return FriendChat(
          type: type,
          info: doc.get('info'),
          date: doc.get('date'),
        );
      },
    ).toList();
  }

  Future<void> addChat(UserChat c, int chatNumber) async {
    try {
      await userChat
          .doc('chat_$chatNumber')
          .set({'info': c.info, 'date': c.date});
      await Database.ref
          .doc(user.name)
          .collection('Friends')
          .doc(friend.id)
          .update({'total': chatNumber, 'last_msg': c.date, 'msg': c.info});
    } catch (e) {
      print('error : $e');
    }
  }

  Future<void> deleteAll(int total) async {
    try {
      for (int i = 1; i <= total; i++) {
        await userChat.doc('chat_$i').delete();
      }
      await Database.ref
          .doc(user.name)
          .collection('Friends')
          .doc(friend.id)
          .update({'total': 0});
    } catch (e) {
      print('error delete all : $e');
    }
  }

  Stream<bool> get status {
    return Database.ref
        .doc(friend.id)
        .snapshots()
        .map((s) => (s.data() as Map<String, dynamic>)['online']);
  }
}
