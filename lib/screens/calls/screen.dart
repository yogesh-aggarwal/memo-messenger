import 'package:memomessenger/screens/calls/calls.dart';
import 'package:memomessenger/screens/calls/navbar.dart';
import 'package:flutter/material.dart';

class CallsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Navbar(),
          Calls(),
        ],
      ),
    );
  }
}
