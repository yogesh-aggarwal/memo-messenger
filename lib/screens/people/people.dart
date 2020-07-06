import 'dart:async';
import 'package:falcon/screens/people/person.dart';
import 'package:falcon/services/data.service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  List<Contact> contacts;
  // ignore: cancel_subscriptions
  StreamSubscription contactsSub;
  bool isPermited = true;

  void checkPermission() async {
    bool permission = await Permission.contacts.isGranted;
    this.setState(() {
      this.isPermited = permission;
    });
  }

  @override
  void initState() {
    this.checkPermission();
    this.contactsSub = Data.contacts.listen((contacts) {
      this.setState(() {
        this.contacts = contacts;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    this.contactsSub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (this.contacts == null) {
      if (isPermited) {
        return Data.linearProgress;
      } else {
        return Text("Permission issue");
      }
    } else {
      return Container(
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: this.contacts.length,
            itemBuilder: (context, index) {
              return Person(this.contacts[index]);
            },
          ),
        ),
      );
    }
  }
}
