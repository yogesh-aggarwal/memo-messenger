import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Constants.dart';

class UserProfileActivity extends StatelessWidget {
  final String userId;

  UserProfileActivity({@required this.userId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            child: Text(userId),
          ),
        ),
      ),
    );
  }
}
