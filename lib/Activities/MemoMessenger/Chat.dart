import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;

  ChatWidget({@required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Chat"),
    );
  }
}
