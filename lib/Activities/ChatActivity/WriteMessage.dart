import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
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
        margin: EdgeInsets.only(bottom: 6),
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
        child: Icon(icon),
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
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Color(0xFFEAEDF1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          MessageAction(icon: LineAwesomeIcons.camera, onTap: () {}),
          MessageAction(icon: LineAwesomeIcons.photo_video, onTap: () {}),
          MessageAction(icon: LineAwesomeIcons.microphone, onTap: () {}),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              child: Container(
                // height: 20,
                child: TextField(
                  controller: textController,
                  decoration: const InputDecoration(
                    hintText: "Convey your message",
                    border: InputBorder.none,
                  ),
                  autocorrect: true,
                  // autofocus: true,
                  maxLines: null,
                  keyboardType: TextInputType.multiline,
                ),
              ),
            ),
          ),

          /// Send message
          GestureDetector(
            onTap: () {
              if (textController.text.trim().isNotEmpty) {
                sendMessage(
                  chatId,
                  Message(text: textController.text, senderId: currentUserId),
                );
                textController.clear();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                      color: Theme.of(context).accentColor,
                      blurRadius: 60,
                      spreadRadius: 2),
                ],
              ),
              margin: EdgeInsets.only(bottom: 6),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              child: Icon(
                Icons.arrow_upward,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
