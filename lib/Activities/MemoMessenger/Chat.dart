import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Activities/ChatActivity/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class ChatWidget extends StatelessWidget {
  final Chat chat;

  ChatWidget({@required this.chat});

  Widget chatText({@required String content, @required IconData icon}) {
    return Container(
      margin: EdgeInsets.only(top: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 5),
            child: Icon(icon, size: 16),
          ),
          Expanded(
            child: Text(
              content,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }

  Widget chatMessageText() {
    Message message = chat.messages.last;
    if (message.text != null) {
      return chatText(content: message.text, icon: LineAwesomeIcons.sms);
    }
    if (message.audio != null) {
      return chatText(content: "Audio", icon: LineAwesomeIcons.headphones);
    }
    if (message.video != null) {
      return chatText(content: "Video", icon: LineAwesomeIcons.video_1);
    }
    if (message.image != null) {
      return chatText(content: "Image", icon: LineAwesomeIcons.image);
    }
    if (message.apk != null) {
      return chatText(content: "APK", icon: LineAwesomeIcons.android);
    }
    if (message.doc != null) {
      return chatText(content: "Document", icon: LineAwesomeIcons.file_invoice);
    }
    if (message.contact != null) {
      return chatText(content: "Contact", icon: LineAwesomeIcons.address_card);
    }
    if (message.location != null) {
      return chatText(content: "Location", icon: LineAwesomeIcons.map_marker);
    }
    if (message.poll != null) {
      return chatText(content: "Poll", icon: LineAwesomeIcons.poll);
    }

    return Container(child: Text("Message"));
  }

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
        subtitle: chatMessageText(),
        trailing: Text(chat.messages.last.sentAt.toString()),
      );
    } else {
      return Container();
    }
  }
}
