import 'package:falcon/screens/chats/chats.dart';
import 'package:falcon/screens/chats/screen.dart';
import 'package:falcon/screens/people/screen.dart';
import 'package:falcon/services/data.service.dart';
import 'package:falcon/screens/people/navbar.dart';
import 'package:falcon/widgets/stories/stories.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Falcon());
}

class Falcon extends StatefulWidget {
  @override
  _FalconState createState() => _FalconState();
}

class _FalconState extends State<Falcon> {
  int navCurrentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehavior()
            ..buildViewportChrome(context, null, AxisDirection.down),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          body: PageView(
            children: <Widget>[
              PeopleScreen(),
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
            ],
            controller: Data.pageController,
            onPageChanged: (index) {
              setState(() {
                this.navCurrentIndex = index;
              });
            },
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline, color: Colors.green[800]),
                title: Text(""),
                activeIcon: Icon(Icons.people, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.label_outline, color: Colors.green[800]),
                title: Text(""),
                activeIcon: Icon(Icons.label, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline, color: Colors.green[800]),
                title: Text(""),
                activeIcon: Icon(Icons.chat_bubble, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.outlined_flag, color: Colors.green[800]),
                title: Text(""),
                activeIcon: Icon(Icons.flag, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.green[800]),
                title: Text(""),
                activeIcon: Icon(Icons.person, color: Colors.green[800]),
              ),
            ],
            currentIndex: this.navCurrentIndex,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                this.navCurrentIndex = index;

                Data.pageController.animateToPage(
                  index,
                  duration: Duration(seconds: 1),
                  curve: Curves.easeInOutQuad,
                );
              });
            },
          ),
        ),
      ),
    );
  }
}
