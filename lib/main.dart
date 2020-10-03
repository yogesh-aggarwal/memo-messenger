import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/MemoMessenger/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: themeAccentColor,
        accentColorBrightness: Brightness.light,
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          color: themeAccentColor,
          elevation: 0,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MemoMessenger(),
    );
  }

  Main() {
    getSections();
  }
}
