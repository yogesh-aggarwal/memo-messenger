import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class IconAction extends StatelessWidget {
  IconData icon;
  Function onPressed;
  Color color;

  IconAction({IconData icon, Function onPressed, Color color = Colors.black}) {
    this.icon = icon;
    this.onPressed = onPressed;
    this.color = color;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      child: IconButton(
        onPressed: this.onPressed,
        icon: Icon(
          this.icon,
          color: this.color,
        ),
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
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.green[500],
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color(0xFFCCCCCC),
          ),
          BoxShadow(
            blurRadius: 0,
            color: Color(0xFFCCCCCC),
          ),
        ],
      ),
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
                color: Colors.white,
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image(
                        image: NetworkImage(
                          this.chat["otherUser"]["profileImg"],
                        ),
                        width: 45,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 13),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            this.chat["otherUser"]["name"],
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            this.chat["otherUser"]["status"],
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
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
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
