import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';
import 'package:memomessenger/Services/User.dart';

Widget buildMessageWidget(
  BuildContext context,
  Message message,
  String currentUserId,
) {
  final bool isFromCurrentUser = message.senderId == currentUserId;
  return Align(
    alignment: isFromCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 3),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * .75,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(
            isFromCurrentUser ? 0 : messageBorderRadius,
          ),
          topLeft: Radius.circular(
            isFromCurrentUser ? messageBorderRadius : 0,
          ),
          bottomLeft: Radius.circular(messageBorderRadius),
          bottomRight: Radius.circular(messageBorderRadius),
        ),
        boxShadow: isFromCurrentUser
            ? [
                BoxShadow(color: themeAccentColor[300], blurRadius: 10),
              ]
            : [
                BoxShadow(color: Colors.black26, blurRadius: 10),
              ],
        color: isFromCurrentUser ? themeAccentColor[500] : Color(0xFFEbE7EA),
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

Widget buildChatMessagesUI(BuildContext context, List<Message> messages) {
  final String currentUserId = currentUser.value.id;
  return SingleChildScrollView(
    reverse: true,
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        verticalDirection: VerticalDirection.up,
        children: messages.reversed.map((Message message) {
          return buildMessageWidget(context, message, currentUserId);
        }).toList(),
      ),
    ),
  );
}

Widget buildMessageAction({@required IconData icon, @required Function onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 6),
      child: Icon(icon, color: themeAccentColor[800]),
    ),
  );
}

Widget buildMessageInputUI(BuildContext context, {@required String chatId}) {
  final String currentUserId = currentUser.value.id;
  String text = "";
  return Container(
    margin: EdgeInsets.only(top: 5),
    padding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 2),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        buildMessageAction(icon: LineAwesomeIcons.camera, onTap: () {}),
        buildMessageAction(icon: LineAwesomeIcons.photo_video, onTap: () {}),
        buildMessageAction(icon: LineAwesomeIcons.microphone, onTap: () {}),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * .58,
            // height: 20,
            child: TextField(
              decoration: const InputDecoration(
                hintText: "Convey your message",
                border: InputBorder.none,
              ),
              onChanged: (String message) {
                text = message;
              },
              autofocus: true,
              autocorrect: true,
              keyboardType: TextInputType.multiline,
            ),
          ),
        ),
        buildMessageAction(
            icon: Icons.send,
            onTap: () {
              sendMessage(chatId, Message(text: text, senderId: currentUserId));
            }),
      ],
    ),
  );
}

class ChatActivity extends StatelessWidget {
  final String chatId;

  ChatActivity({@required this.chatId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: StreamBuilder<Map<String, Chat>>(
                    stream: chatActivityChatList,
                    initialData: {},
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<String, Chat>> data) {
                      if (data.hasData && data.data[chatId] != null) {
                        return buildChatMessagesUI(
                            context, data.data[chatId].messages);
                      } else {
                        return Text("No Data");
                      }
                    },
                  ),
                ),
                buildMessageInputUI(context, chatId: chatId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
