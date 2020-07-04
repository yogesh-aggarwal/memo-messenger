import 'dart:async';

import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  @override
  _ChatViewState createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  var chat;

  // ignore: cancel_subscriptions
  StreamSubscription subscription;

  _ChatViewState() {
    this.subscription = Data.currentChatIndex.listen((int index) {
      setState(() {
        this.chat = Data.chats[index];
      });
    });
  }

  @override
  dispose() {
    this.subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(Icons.open_in_browser),
        onPressed: () {},
      ),
    );
  }
}
