import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class Data {
  static PageController pageController = new PageController(initialPage: 2);

  static List<Contact> contacts = [];
  static List<dynamic> calls = [];

  static Widget linearProgress = Container(
    height: 2,
    child: LinearProgressIndicator(
      backgroundColor: Colors.green[200],
      valueColor: AlwaysStoppedAnimation<Color>(Colors.green[800]),
    ),
  );
}
