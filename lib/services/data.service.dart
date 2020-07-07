import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/subjects.dart';

class Data {
  static PageController pageController = new PageController(initialPage: 2);

  static String userId = "Gwi9iJzZ83lZPRvfI3YK";
  // ignore: close_sinks
  static BehaviorSubject<dynamic> currentUser = new BehaviorSubject();

  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> messages = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<List<Contact>> contacts = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> calls = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<dynamic> currentChat = new BehaviorSubject<dynamic>();
  static int currentChatIndex = 0;
  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> chats = new BehaviorSubject();

  static Firestore firestore = Firestore.instance;
  static DocumentReference messagesRef =
      firestore.collection("messages").document(Data.userId);
  static CollectionReference usersRef = firestore.collection("users");

  static Widget linearProgress = Container(
    height: 2,
    child: LinearProgressIndicator(
      backgroundColor: Colors.green[200],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green[800]),
    ),
  );

  static setDummyMessage() async {
    await messagesRef
        .collection("people/r3jwPaYs1MoJ5S8lphiR/messages")
        .document("Hx6LQg0n6yLFiOznqzN7")
        .setData({
      "text": "Hello Yogesh!",
      "image": null,
      "audio": null,
      "video": null,
      "apk": null,
      "doc": null,
      "contact": null,
      "location": null,
      "reaction": null,
      "poll": null,
      "isHighlighted": false,
      "isDelivered": false,
      "isImportant": false,
      "isNotified": false,
      "isRead": false,
      "isTrash": false,
      "isDeleted": false,
      "isTemplate": false,
      "autoDelete": null,
      "scheduledAt": null,
      "labels": [],
      "dateSent": Timestamp.now(),
    });
  }

  static getChats() async {
    final peopleRef = messagesRef.collection("people");
    // ignore: cancel_subscriptions
    peopleRef.snapshots().listen((chatsSnapshot) async {
      final chats = chatsSnapshot.documents;
      List<dynamic> _chats = [];

      for (DocumentSnapshot chat in chats) {
        dynamic _chat = chat.data;
        _chat["otherUserId"] = chat.documentID;
        _chat["otherUser"] =
            (await usersRef.document(chat.documentID).get()).data;
        _chat["messages"] = (await peopleRef
                .document(chat.documentID)
                .collection("messages")
                .orderBy("dateSent", descending: true)
                .getDocuments())
            .documents
            .map((message) => message.data)
            .toList();

        _chats.add(_chat);
      }

      Data.chats.add(_chats);
    });
  }

  static getMessages() {
    firestore
        .collection("messages")
        .where("chatId", isEqualTo: "HcLtPW2IbjSywTgUcbZW")
        .limit(25)
        .orderBy("dateSent", descending: true)
        .getDocuments()
        .asStream()
        .listen((event) {
      print(event);
    });
  }

  static getContacts() async {
    await Permission.contacts.request();
    if (await Permission.contacts.isGranted) {
      Data.contacts.add((await ContactsService.getContacts()).toList());
    } else {
      Data.contacts.add(null);
    }
  }

  static getCalls() async {
    await Permission.contacts.request();
    if (await Permission.contacts.isGranted) {
      Data.calls.add(
        [
          Contact(
            displayName: "Yogesh",
            phones: [Item(value: "9425895434")],
          ),
        ],
      );
    } else {
      Data.calls.add(null);
    }
  }

  static getUser() {
    usersRef.document(Data.userId).get().asStream().listen((user) {
      user.data["userId"] = user.documentID;
      currentUser.add(user.data);
    });
  }
}
