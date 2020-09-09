import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/User.dart';

Widget buildChatMessagesUI(List<Message> messages) {
  final String currentUserId = currentUser.value.id;
  final totalLength = messages.length;
  return ListView.builder(
    itemCount: messages.length,
    scrollDirection: Axis.vertical,
    reverse: true,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, int index) {
      final Message message = messages[totalLength - index - 1];
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        color: Colors.red,
        child: Align(
          alignment: message.senderId == currentUserId
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Text(message.text),
        ),
      );
    },
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
                Expanded(
                  child: StreamBuilder(
                    stream: chatActivityChatList,
                    initialData: {},
                    builder: (BuildContext context,
                        AsyncSnapshot<Map<dynamic, dynamic>> data) {
                      if (data.hasData && data.data[chatId] != null) {
                        return buildChatMessagesUI(data.data[chatId].messages);
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
