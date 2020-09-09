import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Activities/ChatsActivity/Activity.dart';

void main() {
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.green,
        accentColorBrightness: Brightness.light,
        fontFamily: "Poppins",
        textTheme: TextTheme(),
      ),
      builder: (context, child) {
        return ScrollConfiguration(
          behavior: ScrollBehavior()
            ..buildViewportChrome(context, null, AxisDirection.down),
          child: child,
        );
      },
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
  int _navCurrentIndex = 2;
  PageController pageController = new PageController(initialPage: 2);

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
        child: PageView(
          controller: pageController,
          onPageChanged: (int index) {
            setState(() {
              this._navCurrentIndex = index;
            });
          },
          children: [
            Container(),
            Container(
              child: Text("Hello world!"),
            ),
            ChatsActivity(),
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
            activeIcon: Icon(Icons.phone, color: Colors.green[800]),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline, color: Colors.green[800]),
            title: Text("Profile"),
            activeIcon: Icon(Icons.person, color: Colors.green[800]),
          ),
        ],
        currentIndex: this._navCurrentIndex,
        elevation: 20,
        onTap: (index) {
          this.pageController.jumpToPage(index);
        },
      ),
    );
  }
}
