import 'dart:async';

import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:outline_material_icons/outline_material_icons.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  dynamic chat;
  // ignore: cancel_subscriptions
  StreamSubscription chatSub;

  @override
  initState() {
    this.chatSub = Data.currentChat.listen((chat) {
      setState(() {
        this.chat = chat;
      });
    });
    super.initState();
  }

  @override
  dispose() {
    this.chatSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        "I'm chatting with ${this.chat['otherUser']['name']} (${this.chat['otherUser']['phoneNo']})",
      ),
    );
  }
}
