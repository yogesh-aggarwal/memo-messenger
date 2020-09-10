import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:memomessenger/Activities/ChatsActivity/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';

void main() {
  runApp(Main());
}

BottomNavigationBarItem getBottomNavigationItem(
    {@required String name,
    @required IconData inactiveIcon,
    @required IconData activeIcon}) {
  return BottomNavigationBarItem(
    icon: Icon(inactiveIcon, color: bottomAppBarIconColor),
    title: Text(name, style: bottomAppBarIconLabelTextStyle),
    activeIcon: Icon(activeIcon, color: bottomAppBarIconColor),
  );
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
          getBottomNavigationItem(
            name: "People",
            inactiveIcon: Icons.people_outline,
            activeIcon: Icons.people,
          ),
          getBottomNavigationItem(
            name: "Labels",
            inactiveIcon: Icons.label_outline,
            activeIcon: Icons.label,
          ),
          getBottomNavigationItem(
            name: "Chats",
            inactiveIcon: Icons.chat_bubble_outline,
            activeIcon: Icons.chat_bubble,
          ),
          getBottomNavigationItem(
            name: "Call",
            inactiveIcon: LineAwesomeIcons.phone,
            activeIcon: Icons.phone,
          ),
          getBottomNavigationItem(
            name: "Profile",
            inactiveIcon: Icons.person_outline,
            activeIcon: Icons.person,
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
