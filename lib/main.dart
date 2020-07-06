import 'package:falcon/screens/calls/screen.dart';
import 'package:falcon/screens/chats/chats/screen.dart';
import 'package:falcon/screens/labels/screen.dart';
import 'package:falcon/screens/people/screen.dart';
import 'package:falcon/screens/profile/screen.dart';
import 'package:falcon/services/data.service.dart';
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
  var bottomNavTextStyle = GoogleFonts.poppins(
    color: Colors.green[800],
    fontWeight: FontWeight.w600,
  );
  List<Widget> pages = [];

  void prepareData() async {
    Data.getContacts();
    Data.getCalls();
  }

  @override
  void initState() {
    this.prepareData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    PageController pageController = new PageController(
      initialPage: this.navCurrentIndex,
    );
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
          body: PageView(
            physics: AlwaysScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                this.navCurrentIndex = index;
              });
            },
            children: [
              PeopleScreen(),
              LabelsScreen(),
              FutureBuilder(
                future: Future.delayed(Duration(seconds: 4)),
                builder: (context, snapshot) {
                  print("buiold");
                  return ChatScreen();
                },
              ),
              CallsScreen(),
              ProfileScreen(),
            ],
            controller: pageController,
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
              setState(() {
                this.navCurrentIndex = index;
              });
              pageController.jumpToPage(
                index,
                // duration: Duration(milliseconds: 300),
                // curve: Curves.easeInOut,
              );
            },
          ),
        ),
      ),
    );
  }
}
