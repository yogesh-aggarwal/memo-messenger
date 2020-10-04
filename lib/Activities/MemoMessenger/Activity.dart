import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Activities/MemoMessenger/Chats.dart';
import 'package:memomessenger/Activities/MemoMessenger/Sections.dart';
import 'package:memomessenger/Activities/MemoMessenger/changeAccount.dart';
import 'package:memomessenger/Services/Constants.dart';

class MemoMessenger extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: lrPadding,
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onLongPress: () {
                    showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      builder: (context) {
                        return ChangeAccount();
                      },
                    );
                  },
                  child: Icon(
                    LineAwesomeIcons.user,
                    size: 30,
                  ),
                ),
              ),
              Container(
                padding: lrPadding,
                child: Text(
                  "Messages",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: lrPadding.horizontal / 2,
                ),
                child: TextField(
                  style: TextStyle(fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    hintText: "Search messages",
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    filled: true,
                    fillColor: Colors.grey[200],
                    prefixIcon: RotatedBox(
                      quarterTurns: 3,
                      child: Icon(
                        LineAwesomeIcons.search,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ),
              ),
              SectionsWidget(),
              ChatsWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
