import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;

  ChatWidget({@required this.chat});

  @override
  Widget build(BuildContext context) {
    print(currentSection.value);
    if (currentSection.value == "All" ||
        chat.sectionName == currentSection.value) {
      return ListTile(
        onTap: () {
          print("Open: ${chat.id}");
        },
        contentPadding: EdgeInsets.symmetric(
            vertical: 5, horizontal: lrPadding.horizontal / 2),
        leading: Container(
          margin: EdgeInsets.only(right: 2),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 50,
              height: 50,
              color: Colors.grey[600],
              child: BlurHash(
                hash: chat.sender.profileImg.hash,
                image: chat.sender.profileImg.url,
                imageFit: BoxFit.cover,
                duration: Duration(milliseconds: 20),
              ),
            ),
          ),
        ),
        title: Text(chat.sender.name),
        subtitle: Text(chat.messages.last.text),
      );
    } else {
      return Container();
    }
  }
}
