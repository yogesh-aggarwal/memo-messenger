import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/MemoMessenger/Constants.dart';
import 'package:memomessenger/Services/Constants.dart';

class GroupsWidget extends StatefulWidget {
  @override
  _GroupsWidgetState createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: lrPadding,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {},
            child: Text(
              "Favorites",
              style: sectionTitleTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
