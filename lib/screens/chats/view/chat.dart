import 'dart:async';

import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var _chat = snapshot.data;
          return Container(
            child: Text(
              "I'm chatting with ${_chat['otherUser']['name']} (${_chat['otherUser']})",
            ),
          );
        } else {
          return Data.linearProgress;
        }
      },
    );
  }
}
