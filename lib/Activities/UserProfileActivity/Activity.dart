import 'package:flutter/material.dart';

class UserProfileActivity extends StatelessWidget {
  final String userId;

  UserProfileActivity({@required this.userId});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
