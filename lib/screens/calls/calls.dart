import 'dart:async';
import 'package:memomessenger/screens/calls/call.dart';
import 'package:memomessenger/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Calls extends StatefulWidget {
  @override
  _CallsState createState() => _CallsState();
}

class _CallsState extends State<Calls> {
  List<dynamic> calls;
  // ignore: cancel_subscriptions
  StreamSubscription callsSub;
  bool isPermited = true;

  void checkPermission() async {
    bool permission = await Permission.contacts.isGranted;
    this.setState(() {
      this.isPermited = permission;
    });
  }

  @override
  initState() {
    Data.calls.listen((calls) {
      setState(() {
        this.calls = calls;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (this.calls == null) {
      if (isPermited) {
        return Data.linearProgress;
      } else {
        return Text("Permission issue");
      }
    } else {
      return Container(
        child: Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: this.calls.length,
            itemBuilder: (context, index) {
              return Call(this.calls[index]);
            },
          ),
        ),
      );
    }
  }
}
