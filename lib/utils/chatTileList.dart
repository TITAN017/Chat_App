import 'package:chat_app/models/chat.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/utils/chatTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatTileList extends StatefulWidget {
  ChatTileList({Key? key}) : super(key: key);

  @override
  State<ChatTileList> createState() => _ChatTileListState();
}

class _ChatTileListState extends State<ChatTileList> {
  final Tween<Offset> offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    final List<UserChat> userChats = Provider.of<List<UserChat>>(context);
    final List<FriendChat> friendChats = Provider.of<List<FriendChat>>(context);
    final List chats = [...userChats, ...friendChats];
    chats.sort((a, b) => b.date.compareTo(a.date));
    return Container(
      height: MediaQuery.of(context).size.height - 170,
      width: MediaQuery.of(context).size.width,
      padding: CustomInsets.SCREEN_PADDING,
      decoration: BoxDecoration(
        color: CustomColors.CHAT_SCREEN_BACKGROUND_COLOR,
        borderRadius: CustomInsets.SCREEN_BORDER,
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              //keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              key: listKey,
              reverse: true,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatTile(
                  chat: chats[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
