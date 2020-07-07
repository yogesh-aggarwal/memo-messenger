import 'package:memomessenger/screens/chats/view/screen.dart';
import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Chat extends StatefulWidget {
  final chatIndex;

  Chat({@required this.chatIndex}) {}

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var chat;

  bool isInContacts(int phone) {
    return true;
  }

  String getName(int phone) {
    return isInContacts(phone)
        ? this.chat["otherUser"]["name"]
        : "${this.chat['name']} (${this.chat['phoneNo']})";
  }

  @override
  void initState() {
    setState(() {
      chat = Data.chats.value[widget.chatIndex];
    });
    print(this.chat);
    super.initState();
  }

  getSubtitle({@required dynamic message}) {
    return Text(
      message["text"],
      style: GoogleFonts.poppins(
        fontWeight: FontWeight.w400,
        fontSize: 15,
      ),
      overflow: TextOverflow.ellipsis,
    );
  }

  @override
  Widget build(BuildContext context) {
    print(this.chat);
    if (this.chat != null) {
      return ListTile(
        onTap: () {
          Data.currentChat.add(this.chat);
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
            image: NetworkImage(this.chat["otherUser"]['profileImg']),
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          this.getName(this.chat["otherUser"]["phone"]["number"]),
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: getSubtitle(message: this.chat["messages"][0]),
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
      return Container(
        child: Text("gjrleisgjrsgls"),
      );
    }
  }
}
