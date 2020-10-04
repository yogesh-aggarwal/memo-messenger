import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/MemoMessenger/Chat.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class ChatsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: currentSection.value,
      stream: currentSection.stream,
      builder: (context, snapshot) {
        return StreamBuilder<Map<String, Chat>>(
          stream: chats.stream,
          initialData: {},
          builder: (context, snapshot) {
            final Map<String, Chat> _chats = snapshot.data;
            return Expanded(
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(vertical: 15),
                itemCount: _chats.keys.length,
                itemBuilder: (context, index) {
                  final String currentChatId = _chats.keys.elementAt(index);
                  return ChatWidget(chat: _chats[currentChatId]);
                },
              ),
            );
          },
        );
      },
    );
  }
}
