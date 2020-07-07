import 'dart:async';

import 'package:memomessenger/screens/chats/chats/chat.dart';
import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<dynamic> chats;
  // ignore: cancel_subscriptions
  StreamSubscription chatsSub;

  @override
  void initState() {
    this.chatsSub = Data.chats.listen((chats) {
      setState(() {
        this.chats = chats;
        print(this.chats);
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.chatsSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.chats != null) {
      return Container(
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: this.chats.length,
            itemBuilder: (context, index) {
              return Chat(chatIndex: index);
            },
          ),
        ),
      );
    } else {
      return Text("Start a new chat by moving to people tab");
    }
  }
}
