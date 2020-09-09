import 'package:flutter/foundation.dart';
import 'package:memomessenger/Services/Types/Chat.dart';

class Chat {
  final String sender;
  final Message message;

  Chat({
    @required this.sender,
    @required this.message,
  });
}
