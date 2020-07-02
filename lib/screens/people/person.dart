import 'package:contacts_service/contacts_service.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class Person extends StatefulWidget {
  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  List<Contact> contacts = Data.contacts;

  getContacts() async {
    print("I am called!");
    await Permission.contacts.request();
    if (await Permission.contacts.status.isGranted) {
      print("Permission granted");
      Data.contacts = (await ContactsService.getContacts()).toList();
      this.setState(() {
        this.contacts = Data.contacts;
      });
    } else {
      print("Permission denied");
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
                  return ListTile(
                    onTap: () {},
                    title: Text(
                      this.contacts[index].displayName,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      this.contacts[index].phones.toList()[0].value,
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                    leading: CircleAvatar(
                      child: Text(this.contacts[index].initials()),
                      backgroundColor: Colors.green[200],
                    ),
                  );
                },
              ),
            ),
          )
        : CircularProgressIndicator();
  }
}
