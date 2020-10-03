import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/User.dart';

class ChatMessage extends StatelessWidget {
  final BuildContext context;
  final Message message;
  final String currentUserId;

  ChatMessage({
    @required this.context,
    @required this.message,
    @required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    final bool isFromCurrentUser = message.senderId == currentUserId;
    return Align(
      alignment:
          isFromCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(
              isFromCurrentUser ? 0 : 10,
            ),
            topLeft: Radius.circular(
              isFromCurrentUser ? 10 : 0,
            ),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          // boxShadow: isFromCurrentUser
          //     ? [
          //         BoxShadow(color: themeAccentColor[300], blurRadius: 10),
          //       ]
          //     : [
          //         BoxShadow(color: Color(0XFFCCCCCC), blurRadius: 10),
          //       ],
        ),
        child: Column(
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: isFromCurrentUser ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessages extends StatelessWidget {
  final BuildContext context;
  final List<Message> messages;

  ChatMessages({@required this.context, @required this.messages});

  @override
  Widget build(BuildContext context) {
    final String currentUserId = currentUser.value.id;
    return SingleChildScrollView(
      reverse: true,
      padding: EdgeInsets.symmetric(vertical: 10),
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          verticalDirection: VerticalDirection.up,
          children: messages.reversed.map((Message message) {
            return ChatMessage(
              context: context,
              message: message,
              currentUserId: currentUserId,
            );
          }).toList(),
        ),
      ),
    );
  }
}
