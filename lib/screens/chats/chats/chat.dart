import 'package:falcon/screens/chats/view/screen.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  var data;

  Chat(data) {
    this.data = data;
  }

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var chat = {};

  bool isInContacts(int phone) {
    return true;
  }

  parse() {
    var _chat = this.widget.data;

    for (var user in _chat["participants"]) {
      if (user["userId"] == Data.currentUser["userId"]) {
        _chat["thisUser"] = user;
      } else {
        _chat["otherUser"] = user;
      }
    }

    _chat.remove("participants");

    this.chat = _chat;
  }

  String getName(int phone) {
    return isInContacts(phone)
        ? this.chat["otherUser"]["name"]
        : "${this.chat['name']} (${this.chat['phoneNo']})";
  }

  @override
  Widget build(BuildContext context) {
    this.parse();

    print(this.chat);

    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return Scaffold(
                body: SafeArea(
                  child: ChatViewScreen(this.chat),
                ),
              );
            },
          ),
        );
      },
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image(
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/79.jpg",
          ),
          width: 50,
        ),
      ),
      title: Text(
        this.getName(chat["otherUser"]["phoneNo"]),
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        this.chat["latestMessage"]["content"],
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
  }
}
