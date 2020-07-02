import 'package:falcon/screens/chats/chats.dart';
import 'package:falcon/widgets/bottomBar.dart';
import 'package:falcon/widgets/navbar.dart';
import 'package:falcon/widgets/stories/stories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Falcon());
}

class Falcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehavior()..buildViewportChrome(context, null, AxisDirection.down),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: <Widget>[
                Navbar(),
                Stories(),
                Divider(
                  height: 40,
                ),
                Chats(),
              ],
            ),
          ),
          bottomNavigationBar: BottomBar(),
        ),
      ),
    );
  }
}
