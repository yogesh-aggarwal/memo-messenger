import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Constants.dart';

class ChangeAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              contentPadding: lrPadding,
              onTap: () {
                print("Changes Account");
              },
              title: Text("Account 1"),
              subtitle: Text("Last Active at 7:29 PM"),
            ),
          ],
        ),
      ),
    );
  }
}
