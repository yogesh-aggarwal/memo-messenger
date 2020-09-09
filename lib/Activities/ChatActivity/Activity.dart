import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';

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
                StreamBuilder(
                  stream: chatActivityChatList,
                  initialData: {},
                  builder: (BuildContext context,
                      AsyncSnapshot<Map<dynamic, dynamic>> data) {
                    if (data.hasData && data.data[chatId] != null) {
                      return Text(data.data[chatId].message.text);
                    } else {
                      return Text("No Data");
                    }
                  },
                ),
                OutlineButton(
                  child: Text("Change"),
                  onPressed: () {
                    chatActivityChatList.add({
                      "ULJQt9aNbxt00fi": Chat(
                        id: "ULJQt9aNbxt00fi",
                        message: Message(text: "Hello World!"),
                        sender: SenderUser(
                          uid: "Sender ID",
                          name: "John Doe",
                          profileImg: ImageWithHash(
                            hash: "ULJQ+t9aNbxt00fi%2WB.8ofi_S2IUj[WBfP",
                            url: "https://bit.ly/3bEm39U",
                          ),
                          phone:
                              PhoneNumber(countryCode: 91, number: 1234567890),
                        ),
                      ),
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
