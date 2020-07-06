import 'package:memomessenger/screens/chats/view/chatList.dart';
import 'package:memomessenger/screens/chats/view/navbar.dart';
import 'package:memomessenger/screens/chats/view/chat.dart';
// import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';

class ChatViewScreen extends StatefulWidget {
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
          ChatView(),
          // Data.linearProgress,
        ],
      ),
    );
  }
}
