import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Constants.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme,
      builder: materialAppBuilder,
      debugShowCheckedModeBanner: false,
      home: MemoMessenger(),
    );
  }
}

class MemoMessenger extends StatefulWidget {
  @override
  _MemoMessengerState createState() => _MemoMessengerState();
}

class _MemoMessengerState extends State<MemoMessenger> {
  void prepareData() async {}

  @override
  void initState() {
    this.prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Text("Hello"),
      ),
    );
  }
}
