import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';

class Data {
  static PageController pageController = new PageController(initialPage: 2);

  static List<Contact> contacts = [];
  static List<dynamic> calls = [];
}
