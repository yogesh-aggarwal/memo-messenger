import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/ChatsActivity.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<Map<String, Chat>> chatActivityChatList =
    new BehaviorSubject.seeded({
  "ULJQt9aNbxt00fi": Chat(
    id: "ULJQt9aNbxt00fi",
    message: Message(text: "Hello"),
    sender: SenderUser(
      uid: "Sender ID",
      name: "John Doe",
      profileImg: ImageWithHash(
        hash: "ULJQ+t9aNbxt00fi%2WB.8ofi_S2IUj[WBfP",
        url: "https://bit.ly/3bEm39U",
      ),
      phone: PhoneNumber(countryCode: 91, number: 1234567890),
    ),
  ),
});
