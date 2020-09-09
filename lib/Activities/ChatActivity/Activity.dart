import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';
import 'package:memomessenger/Services/User.dart';

Widget buildMessageWidget(
    BuildContext context, Message message, String currentUserId) {
  final bool isFromCurrentUser = message.senderId == currentUserId;
  return LimitedBox(
    maxWidth: MediaQuery.of(context).size.width * .75,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 2),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
        color: isFromCurrentUser ? themeAccentColor[500] : Colors.cyan,
      ),
      child: Align(
        alignment:
            isFromCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          message.text,
          style: TextStyle(
            color: isFromCurrentUser ? Colors.white : Colors.black,
          ),
        ),
      ),
    ),
  );
}

Widget buildChatMessagesUI(BuildContext context, List<Message> messages) {
  final String currentUserId = currentUser.value.id;
  // final totalLength = messages.length;
  // return ListView.builder(
  //   itemCount: messages.length,
  //   scrollDirection: Axis.vertical,
  //   reverse: true,
  //   shrinkWrap: true,
  //   itemBuilder: (BuildContext context, int index) {
  //     final Message message = messages[totalLength - index - 1];
  //     final bool isFromCurrentUser = message.senderId == currentUserId;
  //
  //     return ;
  //   },
  return SingleChildScrollView(
    child: Column(
      verticalDirection: VerticalDirection.up,
      children: messages.reversed.map((Message message) {
        return buildMessageWidget(context, message, currentUserId);
      }).toList(),
    ),
  );
}

Widget buildMessageInputUI({@required String chatId}) {
  final String currentUserId = currentUser.value.id;
  return TextFormField(
    decoration: const InputDecoration(
      hintText: 'Enter your email',
    ),
    onChanged: (String message) {
      sendMessage(chatId, Message(text: message, senderId: currentUserId));
    },
    validator: (value) {
      if (value.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
    autofocus: true,
    autocorrect: true,
    keyboardType: TextInputType.multiline,
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
                buildMessageInputUI(chatId: chatId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
