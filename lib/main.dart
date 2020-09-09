import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

void main() {
  runApp(MemoMessenger());
}

class MemoMessenger extends StatefulWidget {
  @override
  _MemoMessengerState createState() => _MemoMessengerState();
}

class _MemoMessengerState extends State<MemoMessenger> {
  int navCurrentIndex = 2;
  List<Widget> pages = [];
  int pageAnimationDuration = 200;
  bool _visible = true;
  PageController pageController = new PageController(initialPage: 2);

  void prepareData() async {
    // Data.getUser();
    // Data.getChats();
    // Data.getContacts();
    // Data.getCalls();
  }

  @override
  void initState() {
    this.prepareData();
    super.initState();
  }

  void animate() async {
    setState(() {
      _visible = false;
    });
    Future.delayed(Duration(milliseconds: this.pageAnimationDuration))
        .then((_) {
      setState(() {
        _visible = true;
      });
    });
  }

  void changePage(int index) {
    this.pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
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
      home: Scaffold(
        body: SafeArea(
          child: PageView(
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                this.navCurrentIndex = index;
              });
            },
            children: [
              Container(),
              Container(),
              Container(),
              Container(),
              Container(),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.people_outline, color: Colors.green[800]),
              title: Text("People"),
              activeIcon: Icon(Icons.people, color: Colors.green[800]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.label_outline, color: Colors.green[800]),
              title: Text("Labels"),
              activeIcon: Icon(Icons.label, color: Colors.green[800]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline, color: Colors.green[800]),
              title: Text("Chats"),
              activeIcon: Icon(Icons.chat_bubble, color: Colors.green[800]),
            ),
            BottomNavigationBarItem(
              icon: Icon(LineAwesomeIcons.phone, color: Colors.green[800]),
              title: Text("Call"),
              activeIcon:
                  Icon(Icons.phone, color: Colors.green[800]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, color: Colors.green[800]),
              title: Text("Profile"),
              activeIcon: Icon(Icons.person, color: Colors.green[800]),
            ),
          ],
          currentIndex: this.navCurrentIndex,
          elevation: 20,
          onTap: (index) {
            if (this.navCurrentIndex != index) {
              animate();
              Future.delayed(
                Duration(milliseconds: this.pageAnimationDuration),
              ).then((_) {
                this.changePage(index);
              });
            }
          },
        ),
      ),
    );
  }
}
