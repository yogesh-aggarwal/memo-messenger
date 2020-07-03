import 'package:falcon/screens/chats/chats/chat.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  List<dynamic> chats = [
    {
      "participants": [
        {
          "profileImg": "https://randomuser.me/api/portraits/women/79.jpg",
          "phoneNo": 676898787,
          "name": "Pankaj",
          "userId": "676898787",
        },
        {
          "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
          "phoneNo": 123456789,
          "name": "Aryan",
          "userId": "976898789",
        },
      ],
      "chatId": "fgohgfjhtgklhdgflkhdddddqfjhd",
      "latestMessage": {
        "type": "text",
        "content": "Hi!!!",
        "sentDate": 123456789034,
      },
    },
    {
      "participants": [
        {
          "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
          "phoneNo": 676898787,
          "name": "Pankaj",
          "userId": "676898787",
        },
        {
          "profileImg": "https://randomuser.me/api/portraits/women/79.jpg",
          "phoneNo": 676898783,
          "name": "Suman Bua Ji",
          "userId": "976898789",
        },
      ],
      "chatId": "fgohgfjhtgklhdgflkhjfgklhfjhd",
      "latestMessage": {
        "type": "text",
        "content": "Hello Pankaj!!!",
        "sentDate": 123456789034,
      },
    },
  ];

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
            return Chat(widget.chats[index]);
          },
        ),
      ),
    );
  }
}
