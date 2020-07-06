import 'package:memomessenger/screens/chats/chats/navbar.dart';
import 'package:memomessenger/screens/chats/chats/chats.dart';
import 'package:memomessenger/widgets/stories/stories.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Navbar(),
          Stories(),
          Divider(height: 40),
          Chats(),
        ],
      ),
    );
  }
}
