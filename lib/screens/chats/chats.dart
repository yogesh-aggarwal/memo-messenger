import 'package:falcon/screens/chats/chat.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  List<dynamic> chats = [
    {
      "participants": [
        {
          "profilePic": "https://randomuser.me/api/portraits/women/79.jpg",
          "phoneNo": 676898787,
        },
        {
          "profilePic": "https://randomuser.me/api/portraits/men/86.jpg",
          "phoneNo": 123456789,
        },
      ],
      "chatId": "fgohgfjhtgklhdgflkhjfgklhfjhd",
      "latestMessage": {
        "type": "text",
        "content": "Hello",
        "sentDate": 123456789034,
      },
    },
    {
      "participants": [
        {
          "profilePic": "https://randomuser.me/api/portraits/men/86.jpg",
          "phoneNo": 123456789,
        },
        {
          "profilePic": "https://randomuser.me/api/portraits/women/79.jpg",
          "phoneNo": 676898787,
        },
      ],
      "chatId": "fgohgfjhtgklhdgflkhjfgklhfjhd",
      "latestMessage": {
        "type": "text",
        "content": "Hello",
        "sentDate": 123456789034,
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: this.chats.length,
        itemBuilder: (context, index) {
          return Chat(chats[index]);
        },
      ),
    ));
  }
}
