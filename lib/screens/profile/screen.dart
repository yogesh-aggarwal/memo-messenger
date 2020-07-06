import 'package:memomessenger/screens/profile/profile.dart';
import 'package:memomessenger/screens/profile/stories.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Profile(),
          Divider(),
          Stories(),
        ],
      ),
    );
  }
}
