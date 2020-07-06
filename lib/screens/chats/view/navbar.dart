import 'dart:async';

import 'package:memomessenger/services/data.service.dart';
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
  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  var chat;
  // ignore: cancel_subscriptions
  StreamSubscription subscription;

  @override
  initState() {
    this.subscription = Data.currentChat.listen((chat) {
      setState(() {
        this.chat = chat;
      });
    });
    super.initState();
  }

  @override
  dispose() {
    this.subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return this.chat != null
        ? Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Color(0xFFEEEEEE),
                ),
              ),
            ),
            child: ListTile(
              leading: Container(
                child: SizedBox(
                  height: 60,
                  width: 60,
                  child: Row(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image(
                          image: NetworkImage(
                            this.chat["otherUser"]["profileImg"],
                          ),
                          width: 45,
                          height: 45,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text(
                this.chat["otherUser"]["name"],
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1A1A),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                this.chat["otherUser"]["status"],
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1A1A1A),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              trailing: IconAction(
                icon: Icons.arrow_back,
                onPressed: () {
                  Navigator.pop(context);
                },
                color: Color(0xFF1A1A1A),
              ),
            ),
          )
        : Data.linearProgress;
  }
}
