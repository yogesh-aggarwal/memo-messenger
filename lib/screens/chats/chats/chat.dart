import 'dart:async';

import 'package:falcon/screens/chats/view/screen.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  dynamic chat;
  int chatIndex;

  Chat(dynamic chat, int index) {
    this.chat = chat;
    this.chatIndex = index;
  }

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  bool isInContacts(int phone) {
    return true;
  }

  String getName(int phone) {
    return isInContacts(phone)
        ? widget.chat["otherUser"]["name"]
        : "${widget.chat['name']} (${widget.chat['phoneNo']})";
  }

  parse() {
    if (widget.chat["participants"] != null) {
      for (var user in widget.chat["participants"]) {
        if (user["userId"] == Data.currentUser["userId"]) {
          widget.chat["thisUser"] = user;
        } else {
          widget.chat["otherUser"] = user;
        }
      }
    } else {
      Navigator.of(context).pop();
    }
    widget.chat.remove("participants");
  }

  @override
  Widget build(BuildContext context) {
    this.parse();
    if (widget.chat != null) {
      return ListTile(
        onTap: () {
          Data.currentChat.add(widget.chat);
          Data.currentChatIndex = widget.chatIndex;
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return SafeArea(
                  child: Scaffold(
                    body: ChatViewScreen(),
                  ),
                );
              },
            ),
          );
        },
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Image(
            image: NetworkImage(widget.chat["otherUser"]['profileImg']),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          this.getName(widget.chat["otherUser"]["phoneNo"]),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          widget.chat["latestMessage"]["content"],
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 15,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.green[500],
            borderRadius: BorderRadius.circular(5),
          ),
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
          child: Text(
            "26",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
