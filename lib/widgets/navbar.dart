import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String title = "Chats";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 25),
            child: Text(
              this.title,
              style: GoogleFonts.poppins(
                fontSize: 40,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 25),
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
