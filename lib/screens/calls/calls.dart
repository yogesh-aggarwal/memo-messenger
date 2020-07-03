import 'package:contacts_service/contacts_service.dart';
import 'package:falcon/screens/calls/call.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  List<dynamic> calls = Data.calls;

  getCalls() async {
    this.calls = [
      Contact(
        displayName: "Yogesh",
        phones: [
          Item(value: "1234567890"),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    if (Data.calls.length == 0) {
      this.getCalls();
    }

    return this.calls.length != 0
        ? Container(
            child: Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: this.calls.length,
                itemBuilder: (context, index) {
                  return Call(this.calls[index]);
                },
              ),
            ),
          )
        : CircularProgressIndicator();
  }
}
