import 'package:flutter/material.dart';

class Label extends StatefulWidget {
  @override
  _LabelState createState() => _LabelState();
}

class _LabelState extends State<Label> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("I'am a Label"),
    );
  }
}
