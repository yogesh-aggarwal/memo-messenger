import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class ChatList extends StatefulWidget {
  final List<dynamic> chats = Data.chats;

  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  double getScrollPosition({@required int index}) {
    return MediaQuery.of(context).size.width * .2 * (index - 2);
  }

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = new ScrollController(
      initialScrollOffset: getScrollPosition(
        index: Data.currentChatIndex.value,
      ),
    );

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFCCCCCC),
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            for (int i = 0; i < widget.chats.length; i++)
              GestureDetector(
                onTap: () {
                  Data.currentChatIndex.add(i);
                  scrollController.animateTo(
                    getScrollPosition(index: i),
                    duration: Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                  );
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * .02,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(13),
                    child: Image(
                      image: NetworkImage(
                        widget.chats[i]["otherUser"]['profileImg'],
                      ),
                      width: MediaQuery.of(context).size.width * .16,
                      height: MediaQuery.of(context).size.width * .16,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
