import 'package:flutter/foundation.dart';
import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';

class Chat {
  final String id;
  final SenderUser sender;
  final List<Message> messages;

  Chat({
    @required this.id,
    @required this.sender,
    @required this.messages,
  });
}
