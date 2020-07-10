import 'package:memomessenger/screens/chats/chats/chat.dart';
import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';

class Chats extends StatefulWidget {
  @override
  _ChatsState createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Data.chats,
      initialData: null,
      builder: (context, snapshot) {
        print(snapshot.data);
        if (snapshot.hasData) {
          List<dynamic> _chats = snapshot.data;
          if (_chats.length != 0) {
            return Container(
              child: Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _chats.length,
                  itemBuilder: (context, index) {
                    return Chat(chatIndex: index);
                  },
                ),
              ),
            );
          } else {
            return Column(
              children: <Widget>[
                Icon(
                  Icons.chat_bubble,
                  size: MediaQuery.of(context).size.width * .4,
                  color: Colors.green[800],
                ),
                Container(
                  margin: EdgeInsets.only(top: 15),
                  width: MediaQuery.of(context).size.width * .8,
                  child: Text(
                    "Looks like you haven't started your conversation!",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            );
          }
        } else {
          return Data.linearProgress;
        }
      },
    );
  }
}
