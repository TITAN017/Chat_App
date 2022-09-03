import 'package:chat_app/models/chat.dart';
import 'package:chat_app/shared/colorTheme.dart';
import 'package:chat_app/shared/dimensions.dart';
import 'package:chat_app/utils/chatTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatTileList extends StatelessWidget {
  const ChatTileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<UserChat> userChats = Provider.of<List<UserChat>>(context);
    final List<FriendChat> friendChats = Provider.of<List<FriendChat>>(context);
    final List chats = [...userChats, ...friendChats];
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
              reverse: true,
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatTile(chat: chats[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}
