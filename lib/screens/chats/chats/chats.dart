import 'package:falcon/screens/chats/chats/chat.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  final chats = Data.chats;

  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: widget.chats.length,
          itemBuilder: (context, index) {
            return Chat(index);
          },
        ),
      ),
    );
  }
}
