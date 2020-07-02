import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int navCurrentIndex = 2;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
        });
      },
    );
  }
}
