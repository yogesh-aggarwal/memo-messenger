import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String currentUser = "qwertyuiop";

class Chat extends StatefulWidget {
  var data;

  Chat(data) {
    this.data = data;
  }

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  var chat = {};

  bool isInContacts(int phone) {
    return true;
  }

  parse() {
    var _chat = this.widget.data;

    _chat["name"] = "AHello";
    _chat["phoneNo"] = _chat["participants"][0]["phoneNo"];

    this.chat = _chat;
  }

  String getName(int phone) {
    print("frdk");
    return isInContacts(phone)
        ? this.chat["name"]
        : "${this.chat['name']} (${this.chat['phoneNo']})";
  }

  @override
  Widget build(BuildContext context) {
    this.parse();

    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05,
          vertical: 10,
        ),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: NetworkImage(
                "https://randomuser.me/api/portraits/women/79.jpg",
              ),
              radius: 25,
            ),
            Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    this.getName(this.chat["phoneNo"]),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "jiofHJOGGFHJG;MHGFKMHJGFKLHJMGFKLNJGFKLNJGFKLNM ,GFJNGLKJGHLMNJ,GH.MNJGHKLNJGHKLNG",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                    ),
                    // overflow: TextOverflow.clip,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
