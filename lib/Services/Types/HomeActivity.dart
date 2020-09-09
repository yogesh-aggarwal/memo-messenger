import 'package:flutter/foundation.dart';
import 'package:memomessenger/Services/Types/Chat.dart';

class HomeChat {
  final String sender;
  final Message message;

  HomeChat({
    @required this.sender,
    @required this.message,
  });
}
