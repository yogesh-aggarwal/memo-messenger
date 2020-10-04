import 'package:memomessenger/Services/Types/Chat.dart';
import 'package:memomessenger/Services/Types/Fundamental.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';
import 'package:rxdart/subjects.dart';

BehaviorSubject<Map<String, Chat>> chats = new BehaviorSubject.seeded(
  {
    "ULJQt9aNbxt00fi": Chat(
      id: "ULJQt9aNbxt00fi",
      messages: [
        Message(
          text: "Hello!",
          senderId: "Sender ID",
          sentAt: DateTime.now(),
        ),
        Message(
          text: "Hello World!",
          senderId: "Gwi9iJzZ83lZPRvfI3YK",
          sentAt: DateTime.now(),
        ),
      ],
      sectionName: "Favorites",
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
    "ULJQta9aNbxt00fi": Chat(
      id: "ULJQt9aNbxt00fi",
      messages: [
        Message(
          text: "Hello!",
          senderId: "Sender ID",
          sentAt: DateTime.now(),
        ),
        Message(
          text: "Hello World!",
          senderId: "Gwi9iJzZ83lZPRvfI3YK",
          sentAt: DateTime.now(),
        ),
      ],
      sectionName: "Family",
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
  Map<String, Chat> _chats = chats.value;
  Chat newData = _chats[chatId];
  newData.messages.add(message);
  chats.add(_chats);
}

void getSections() async {
  sections.add(["All", "Favorites", "Family", "Office"]);
}

final BehaviorSubject<List<String>> sections = new BehaviorSubject.seeded([]);
final BehaviorSubject<String> currentSection = new BehaviorSubject.seeded(
  "All",
);
