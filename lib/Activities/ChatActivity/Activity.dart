import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/ChatActivity/Messages.dart';
import 'package:memomessenger/Activities/ChatActivity/WriteMessage.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';

class ChatActivity extends StatelessWidget {
  final String chatId;

  ChatActivity({@required this.chatId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: StreamBuilder<Map<String, Chat>>(
                    stream: chatActivityChatList,
                    initialData: {},
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, Chat>> data) {
                      if (data.hasData && data.data[chatId] != null) {
                        return ChatMessages(
                          context: context,
                          messages: data.data[chatId].messages,
                        );
                      } else {
                        return Text("No Data");
                      }
                    },
                  ),
                ),
                MessageInputUI(context: context, chatId: chatId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
