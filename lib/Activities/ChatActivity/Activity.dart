import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Activities/ChatActivity/Messages.dart';
import 'package:memomessenger/Activities/ChatActivity/WriteMessage.dart';
import 'package:memomessenger/Activities/UserProfileActivity/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

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
      child: StreamBuilder<Map<String, Chat>>(
        stream: chats.stream,
        initialData: {},
        builder: (context, data) {
          final Map<String, Chat> chats = data.data;
          final Chat currentChat = chats[chatId];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListTile(
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
                  trailing: IconButton(
                    icon: Icon(
                      LineAwesomeIcons.arrow_left,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ),
                  title: Text(
                    currentChat.sender.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  subtitle: Text(
                    "Active now",
                    style: TextStyle(
                        color: Colors.green, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: chats.keys.length,
                  itemBuilder: (context, index) {
                    final Chat _currentChat =
                        chats[chats.keys.elementAt(index)];
                    return Container(
                      width: 55,
                      height: 55,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: BlurHash(
                          hash: _currentChat.sender.profileImg.hash,
                          image: _currentChat.sender.profileImg.url,
                          imageFit: BoxFit.cover,
                          duration: Duration(milliseconds: 200),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
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
      theme: ThemeData(
        accentColor: themeAccentColor,
        accentColorBrightness: Brightness.light,
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          color: themeAccentColor,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: SenderInfoAppBar(
          height: 180,
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
                    stream: chats,
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
