import 'package:falcon/screens/people/navbar.dart';
import 'package:falcon/screens/people/people.dart';
import 'package:flutter/material.dart';

class PeopleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Navbar(),
          People(),
        ],
      ),
    );
  }
}
