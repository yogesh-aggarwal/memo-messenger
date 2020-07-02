import 'package:falcon/screens/labels/navbar.dart';
import 'package:falcon/screens/labels/labels.dart';
import 'package:flutter/material.dart';

class LabelsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Navbar(),
          Labels(),
        ],
      ),
    );
  }
}
