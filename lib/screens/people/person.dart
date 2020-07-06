import 'package:contacts_service/contacts_service.dart';
import 'package:memomessenger/screens/chats/view/chat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Person extends StatefulWidget {
  Contact contact;

  Person(Contact contact) {
    this.contact = contact;
  }

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  @override
  Widget build(BuildContext context) {
    Contact contact = widget.contact;

    return ListTile(
      onTap: () {},
      title: Text(
        contact.displayName,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        contact.phones.toList().length != 0
            ? contact.phones.toList()[0].value
            : "",
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      leading: CircleAvatar(
        child: Text(contact.initials()),
        backgroundColor: Colors.green[200],
      ),
    );
  }
}
