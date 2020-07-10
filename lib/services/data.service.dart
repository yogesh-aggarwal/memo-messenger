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
  static BehaviorSubject<dynamic> messages = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<List<Contact>> contacts = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> calls = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<dynamic> currentChat = new BehaviorSubject<dynamic>();
  static int currentChatIndex = 0;
  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> chats = new BehaviorSubject();
  // ignore: close_sinks

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
    await firestore
        .collection("chats")
        .document("wWG5VVRaOpvJxuGKt3IC")
        .collection("messages")
        .document("dd6ZKl6Ge7bzOUbTDCIK")
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
      "sentBy": Data.userId,
      "labels": [],
      "dateSent": Timestamp.now(),
    });
  }

  static getChats() async {
//    Data.setDummyMessage();
     final peopleRef = messagesRef.collection("people");
     // ignore: cancel_subscriptions
     peopleRef.snapshots().listen((chatsSnapshot) async {
       print("Value till messages updated!");
       final chats = chatsSnapshot.documents;
       List<dynamic> _chats = [];

       for (DocumentSnapshot chat in chats) {
         dynamic _chat = chat.data;
         _chat["otherUserId"] = chat.documentID;
         _chat["otherUser"] =
             (await usersRef.document(chat.documentID).get()).data;
         _chats.add(_chat);
       }

       Data.chats.add(_chats);
     });
  }

  static getMessages({@required String userId}) async {
    // messagesRef
    firestore
        .collection("messages")
        .document(userId)
        .collection("people")
        .document("r3jwPaYs1MoJ5S8lphiR")
        .collection("messages")
        // .orderBy("dateSent", descending: true)
        .snapshots()
        .listen((messages) {
      print("Value after messages updated!");
      print(messages);
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
