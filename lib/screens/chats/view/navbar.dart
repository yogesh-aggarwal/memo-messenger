import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class IconAction extends StatelessWidget {
  IconData icon;
  Function onPressed;

  IconAction({IconData icon, Function onPressed}) {
    this.icon = icon;
    this.onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: this.onPressed,
        icon: Icon(this.icon),
      ),
    );
  }
}

class Navbar extends StatefulWidget {
  var chat;

  Navbar(var chat) {
    this.chat = chat;
    print(this.chat);
  }

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var chat;

  @override
  Widget build(BuildContext context) {
    this.chat = widget.chat;
    print("this.chat ${this.chat['otherUser']}");

    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
      ),
      // margin: EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconAction(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(
                          this.chat["otherUser"]["profileImg"],
                        ),
                        // width: ,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              IconAction(
                icon: Icons.more_vert,
                onPressed: () {},
              )
            ],
          )
        ],
      ),
    );
  }
}
