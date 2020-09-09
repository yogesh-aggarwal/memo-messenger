import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:memomessenger/Activities/ChatActivity/Activity.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';

Widget getChatTiles(Map<String, Chat> chats) {
  return ListView.builder(
    shrinkWrap: true,
    itemCount: chats.length,
    itemBuilder: (BuildContext context, int index) {
      final List<String> chatIds = chats.keys.toList();
      final Chat chat = chats[chatIds[index]];

      return ListTile(
        title: Text(chat.sender.name),
        subtitle: Text(chat.messages.last.text),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            width: 45,
            height: 45,
            child: BlurHash(
              hash: chat.sender.profileImg.hash,
              image: chat.sender.profileImg.url,
            ),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(builder: (BuildContext context) {
              return ChatActivity(chatId: chat.id);
            }),
          );
        },
      );
    },
  );
}

class ChatsActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Text(
              "Chats",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: StreamBuilder<Map<String, Chat>>(
              stream: chatActivityChatList,
              initialData: {},
              builder: (BuildContext context, AsyncSnapshot<Map<String, Chat>> data) {
                if (data.hasData) {
                  final Map<String, Chat> chats = data.data;
                  if (chats.length != 0) {
                    return getChatTiles(chats);
                  } else {
                    return Text("No chats!", textAlign: TextAlign.center);
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
