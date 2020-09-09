import 'package:flutter/material.dart';

class ChatActivity extends StatelessWidget {
  final String id;

  ChatActivity({@required this.id});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(child: Text(id)),
        ),
      ),
    );
  }
}
