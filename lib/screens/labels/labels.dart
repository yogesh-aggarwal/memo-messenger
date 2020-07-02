import 'package:falcon/screens/labels/label.dart';
import 'package:flutter/material.dart';

class Labels extends StatefulWidget {
  @override
  _LabelsState createState() => _LabelsState();
}

class _LabelsState extends State<Labels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Label(),
    );
  }
}
