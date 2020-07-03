import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Call extends StatefulWidget {
  Contact call;

  Call(Contact call) {
    this.call = call;
  }

  @override
  _CallState createState() => _CallState();
}

class _CallState extends State<Call> {
  @override
  Widget build(BuildContext context) {
    Contact call = widget.call;

    return ListTile(
      onTap: () {},
      title: Text(
        call.displayName,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        call.phones.toList()[0].value,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
      ),
      leading: CircleAvatar(
        child: Text(call.initials()),
        backgroundColor: Colors.green[200],
      ),
    );
  }
}
