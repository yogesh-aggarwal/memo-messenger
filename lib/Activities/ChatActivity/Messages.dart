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
        margin: EdgeInsets.symmetric(vertical: 3),
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * .75,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: !isFromCurrentUser
              ? Border.all(color: Colors.grey[300], width: 2)
              : null,
          color: isFromCurrentUser ? Color(0xFFE7E7EC) : Colors.transparent,
        ),
        child: Column(
          children: [
            Text(
              message.text,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
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
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: SingleChildScrollView(
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
      ),
    );
  }
}
