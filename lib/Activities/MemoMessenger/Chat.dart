import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:memomessenger/Activities/ChatActivity/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;

  ChatWidget({@required this.chat});

  @override
  Widget build(BuildContext context) {
    if (currentSection.value == "All" ||
        chat.sectionName == currentSection.value) {
      return ListTile(
        onTap: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              maintainState: true,
              builder: (context) {
                return ChatActivity(chatId: chat.id);
              },
            ),
          );
          print("Open: ${chat.id}");
        },
        contentPadding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: lrPadding.horizontal / 2,
        ),
        leading: Container(
          margin: EdgeInsets.only(right: 2),
          child: Container(
            width: 55,
            height: 55,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: BlurHash(
                hash: chat.sender.profileImg.hash,
                image: chat.sender.profileImg.url,
                imageFit: BoxFit.cover,
                duration: Duration(milliseconds: 200),
              ),
            ),
          ),
        ),
        title: Text(
          chat.sender.name,
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(chat.messages.last.text),
        trailing: Text(chat.messages.last.sentAt.toString()),
      );
    } else {
      return Container();
    }
  }
}
