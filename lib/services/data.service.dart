import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rxdart/subjects.dart';

class Data {
  static PageController pageController = new PageController(initialPage: 2);

  static dynamic currentUser = {
    "userId": "676898787",
    "name": "Pankaj",
  };

  // ignore: close_sinks
  static BehaviorSubject<List<Contact>> contacts = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> calls = new BehaviorSubject();
  // ignore: close_sinks
  static BehaviorSubject<dynamic> currentChat = new BehaviorSubject<dynamic>();
  static int currentChatIndex = 0;

  // ignore: close_sinks
  static BehaviorSubject<List<dynamic>> chats = new BehaviorSubject();

  static Widget linearProgress = Container(
    height: 2,
    child: LinearProgressIndicator(
      backgroundColor: Colors.green[200],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green[800]),
    ),
  );

  static getChats() async {
    Data.chats.add([
      {
        "participants": [
          {
            "profileImg": "https://randomuser.me/api/portraits/women/79.jpg",
            "status": "Do coding & Be Awesome!",
            "phoneNo": 676898787,
            "name": "Pankaj",
            "userId": "676898787",
          },
          {
            "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
            "status": "Do coding & Be Awesome!",
            "phoneNo": 123456789,
            "name": "Aryan",
            "userId": "976898789",
          },
        ],
        "chatId": "fgohgfjhtgklhdgflkhdddddqfjhd",
        "latestMessage": {
          "type": "text",
          "content": "Hi!!!",
          "sentDate": 123456789034,
        },
      },
      {
        "participants": [
          {
            "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
            "status": "Do coding & Be Awesome!",
            "phoneNo": 676898787,
            "name": "Pankaj",
            "userId": "676898787",
          },
          {
            "profileImg": "https://randomuser.me/api/portraits/women/79.jpg",
            "status": "Do coding & Be Awesome!",
            "phoneNo": 676898783,
            "name": "Suman Bua Ji",
            "userId": "976898789",
          },
        ],
        "chatId": "fgohgfjhtgklhdgflkhjfgklhfjhd",
        "latestMessage": {
          "type": "text",
          "content": "Hello Pankaj!!!",
          "sentDate": 123456789034,
        },
      },
      // {
      //   "participants": [
      //     {
      //       "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689873287,
      //       "name": "Pankaj",
      //       "userId": "6768938787",
      //     },
      //     {
      //       "profileImg": "https://bit.ly/31INyfB",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689328783,
      //       "name": "Usha Bua Ji",
      //       "userId": "9376898789",
      //     },
      //   ],
      //   "chatId": "fgohgfjhtdegklhdgflkhjfgdklhfjhd",
      //   "latestMessage": {
      //     "type": "text",
      //     "content": "Hello Pankaj!!!",
      //     "sentDate": 123456789034,
      //   },
      // },
      // {
      //   "participants": [
      //     {
      //       "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689873287,
      //       "name": "Pankaj",
      //       "userId": "6768938787",
      //     },
      //     {
      //       "profileImg": "https://bit.ly/2VKQBA8",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689328783,
      //       "name": "Akshay Kumar",
      //       "userId": "9376898789",
      //     },
      //   ],
      //   "chatId": "fgohgfjhtdehdrgklhdgflkhjfgdklhfjhd",
      //   "latestMessage": {
      //     "type": "text",
      //     "content": "Hello Pankaj!!!",
      //     "sentDate": 123456789034,
      //   },
      // },
      // {
      //   "participants": [
      //     {
      //       "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689873287,
      //       "name": "Pankaj",
      //       "userId": "6768938787",
      //     },
      //     {
      //       "profileImg": "https://bit.ly/2VKQBA8",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689328783,
      //       "name": "Akshay Kumar",
      //       "userId": "9376898789",
      //     },
      //   ],
      //   "chatId": "fgohgfjhtdehdrgklhdgflkhjfgdklhfjhd",
      //   "latestMessage": {
      //     "type": "text",
      //     "content": "Hello Pankaj!!!",
      //     "sentDate": 123456789034,
      //   },
      // },
      // {
      //   "participants": [
      //     {
      //       "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689873287,
      //       "name": "Pankaj",
      //       "userId": "6768938787",
      //     },
      //     {
      //       "profileImg": "https://bit.ly/2VKQBA8",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689328783,
      //       "name": "Akshay Kumar",
      //       "userId": "9376898789",
      //     },
      //   ],
      //   "chatId": "fgohgfjhtdehdrgklhdgflkhjfgdklhfjhd",
      //   "latestMessage": {
      //     "type": "text",
      //     "content": "Hello Pankaj!!!",
      //     "sentDate": 123456789034,
      //   },
      // },
      // {
      //   "participants": [
      //     {
      //       "profileImg": "https://randomuser.me/api/portraits/men/86.jpg",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689873287,
      //       "name": "Pankaj",
      //       "userId": "6768938787",
      //     },
      //     {
      //       "profileImg": "https://bit.ly/2VKQBA8",
      //       "status": "Do coding & Be Awesome!",
      //       "phoneNo": 67689328783,
      //       "name": "Akshay Kumar",
      //       "userId": "9376898789",
      //     },
      //   ],
      //   "chatId": "fgohgfjhtdehdrgklhdgflkhjfgdklhfjhd",
      //   "latestMessage": {
      //     "type": "text",
      //     "content": "Hello Pankaj!!!",
      //     "sentDate": 123456789034,
      //   },
      // },
    ]);
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
}
