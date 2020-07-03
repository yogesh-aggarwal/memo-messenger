import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  dynamic chatId;

  ChatView(dynamic chatId) {
    this.chatId = chatId;
  }

  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('widget.chatId'),
    );
  }
}
