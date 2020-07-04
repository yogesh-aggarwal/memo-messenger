import 'package:falcon/screens/calls/screen.dart';
import 'package:falcon/screens/chats/chats/screen.dart';
import 'package:falcon/screens/labels/screen.dart';
import 'package:falcon/screens/people/screen.dart';
import 'package:falcon/screens/profile/screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(Falcon());
}

class Falcon extends StatefulWidget {
  @override
  _FalconState createState() => _FalconState();
}

class _FalconState extends State<Falcon> {
  int navCurrentIndex = 2;
  bool _visible = true;
  var bottomNavTextStyle = GoogleFonts.poppins(
    color: Colors.green[800],
    fontWeight: FontWeight.w600,
  );

  animate() {
    setState(() {
      _visible = false;
    });
    Future.delayed(Duration(milliseconds: 250)).then((_) {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      PeopleScreen(),
      LabelsScreen(),
      ChatScreen(),
      CallsScreen(),
      ProfileScreen(),
    ];

    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.green,
        accentColorBrightness: Brightness.light,
        buttonTheme: ButtonThemeData(
          highlightColor: Colors.red,
          hoverColor: Colors.red,
          buttonColor: Colors.red,
          splashColor: Colors.red,
        ),
      ),
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
          body: AnimatedOpacity(
            duration: Duration(milliseconds: 500),
            opacity: _visible ? 1 : 0,
            child: Container(
              child: pages[this.navCurrentIndex],
            ),
            curve: Curves.easeInOut,
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.people_outline, color: Colors.green[800]),
                title: Text("People", style: this.bottomNavTextStyle),
                activeIcon: Icon(Icons.people, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.label_outline, color: Colors.green[800]),
                title: Text("Lables", style: this.bottomNavTextStyle),
                activeIcon: Icon(Icons.label, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.chat_bubble_outline, color: Colors.green[800]),
                title: Text("Chats", style: this.bottomNavTextStyle),
                activeIcon: Icon(Icons.chat_bubble, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.outlined_flag, color: Colors.green[800]),
                title: Text("Call", style: this.bottomNavTextStyle),
                activeIcon: Icon(Icons.flag, color: Colors.green[800]),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline, color: Colors.green[800]),
                title: Text("Profile", style: this.bottomNavTextStyle),
                activeIcon: Icon(Icons.person, color: Colors.green[800]),
              ),
            ],
            currentIndex: this.navCurrentIndex,
            elevation: 20,
            // type: BottomNavigationBarType.fixed,
            onTap: (index) {
              this.animate();
              Future.delayed(Duration(milliseconds: 250)).then((_) {
                setState(() {
                  this.navCurrentIndex = index;
                });
              });
            },
          ),
        ),
      ),
    );
  }
}
