import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:memomessenger/Activities/ChatActivity/Messages.dart';
import 'package:memomessenger/Activities/ChatActivity/WriteMessage.dart';
import 'package:memomessenger/Activities/UserProfileActivity/Activity.dart';
import 'package:memomessenger/Services/Chats.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';

class SenderInfoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String chatId;

  const SenderInfoAppBar({
    Key key,
    @required this.height,
    @required this.chatId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: StreamBuilder<Map<String, Chat>>(
              stream: chatActivityChatList,
              initialData: {},
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, Chat>> data) {
                if (data.hasData && data.data[chatId] != null) {
                  final Chat chat = data.data[chatId];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        CupertinoPageRoute(
                          builder: (BuildContext context) {
                            return UserProfileActivity(
                              userId: "Hello",
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 45,
                          height: 45,
                          child: BlurHash(
                            hash: chat.sender.profileImg.hash,
                            image: chat.sender.profileImg.url,
                          ),
                        ),
                      ),
                      title: Text(
                        chat.sender.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 20,
                        ),
                      ),
                      subtitle: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.green,
                            ),
                            width: 10,
                            height: 10,
                          ),
                          Text("Active"),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Text("No Data");
                }
              },
            ),
          ),
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class ChatActivity extends StatelessWidget {
  final String chatId;

  ChatActivity({@required this.chatId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: SenderInfoAppBar(
          height: 70,
          chatId: chatId,
        ),
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
                        return ChatMessages(
                          context: context,
                          messages: data.data[chatId].messages,
                        );
                      } else {
                        return Text("No Data");
                      }
                    },
                  ),
                ),
                MessageInputUI(context: context, chatId: chatId),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
