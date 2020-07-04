import 'package:falcon/screens/people/person.dart';
import 'package:falcon/services/data.service.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  @override
  _PeopleState createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  List<Contact> contacts = Data.contacts;

  getContacts() async {
    await Permission.contacts.request();
    if (await Permission.contacts.status.isGranted) {
      Data.contacts = (await ContactsService.getContacts()).toList();
      this.setState(() {
        this.contacts = Data.contacts;
      });
    } else {
    }
  }

  @override
  Widget build(BuildContext context) {
    if (Data.contacts.length == 0) {
      this.getContacts();
    }

    return this.contacts.length != 0
        ? Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: this.contacts.length,
                itemBuilder: (context, index) {
                  return Person(this.contacts[index]);
                },
              ),
            ),
          )
        : Data.linearProgress;
  }
}
