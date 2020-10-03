import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/User.dart';

class MessageAction extends StatelessWidget {
  final IconData icon;
  final Function onTap;

  MessageAction({@required this.icon, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Icon(
          icon,
        ),
      ),
    );
  }
}

class MessageInputUI extends StatelessWidget {
  final BuildContext context;
  final String chatId;

  MessageInputUI({@required this.context, @required this.chatId});

  @override
  Widget build(BuildContext context) {
    final String currentUserId = currentUser.value.id;
    TextEditingController textController = new TextEditingController();

    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MessageAction(icon: LineAwesomeIcons.camera, onTap: () {}),
          MessageAction(icon: LineAwesomeIcons.photo_video, onTap: () {}),
          MessageAction(icon: LineAwesomeIcons.microphone, onTap: () {}),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: MediaQuery.of(context).size.width - 42 - 42 - 42 - 42,
              // height: 20,
              child: TextField(
                controller: textController,
                decoration: const InputDecoration(
                  hintText: "Convey your message",
                  border: InputBorder.none,
                ),
                autocorrect: true,
                autofocus: true,
                keyboardType: TextInputType.multiline,
              ),
            ),
          ),
          MessageAction(
            icon: Icons.send,
            onTap: () {
              sendMessage(chatId,
                  Message(text: textController.text, senderId: currentUserId));
              textController.clear();
            },
          ),
        ],
      ),
    );
  }
}
