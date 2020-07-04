import 'package:falcon/screens/chats/view/chatList.dart';
import 'package:falcon/screens/chats/view/navbar.dart';
import 'package:falcon/screens/chats/view/chat.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class ChatViewScreen extends StatefulWidget {
  var chat;

  ChatViewScreen(var chat) {
    this.chat = this.getChat(chat);
  }

  getChat(dynamic chat) {
    chat["messages"] = ["f"];
    return chat;
  }

  @override
  _ChatViewScreenState createState() => _ChatViewScreenState();
}

class _ChatViewScreenState extends State<ChatViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Navbar(),
          ChatList(),
          widget.chat["messages"].length != 0
              ? ChatView(widget.chat)
              : Data.linearProgress,
        ],
      ),
    );
  }
}
