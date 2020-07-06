import 'package:falcon/screens/chats/chats/navbar.dart';
import 'package:falcon/screens/chats/chats/chats.dart';
import 'package:falcon/widgets/stories/stories.dart';
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
