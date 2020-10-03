import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';
import 'package:rxdart/rxdart.dart';

BehaviorSubject<Map<String, Chat>> chatActivityChatList =
    new BehaviorSubject.seeded(
  {
    "ULJQt9aNbxt00fi": Chat(
      id: "ULJQt9aNbxt00fi",
      messages: [
        Message(text: "Hello", senderId: "1"),
        Message(text: "Hello World!", senderId: "Gwi9iJzZ83lZPRvfI3YK"),
      ],
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
  },
);

void sendMessage(String chatId, Message message) {
  Map<String, Chat> chats = chatActivityChatList.value;

  Chat newData = chats[chatId];
  newData.messages.add(message);

  chatActivityChatList.add(chats);
}

final BehaviorSubject<SectionEnum> currentSection = new BehaviorSubject.seeded(
  SectionEnum.Favorites,
);
