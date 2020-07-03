import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class Navbar extends StatefulWidget {
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  String title =  "Calls";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: MediaQuery.of(context).size.width * 0.05,
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            child: Text(
              this.title,
              style: GoogleFonts.poppins(
                fontSize: 35,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            child: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
