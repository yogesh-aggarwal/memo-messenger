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
    return isInContacts(phone)
        ? this.chat["name"]
        : "${this.chat['name']} (${this.chat['phoneNo']})";
  }

  @override
  Widget build(BuildContext context) {
    this.parse();

    return ListTile(
      onTap: () {},
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image(
          image: NetworkImage(
            "https://randomuser.me/api/portraits/women/79.jpg",
          ),
          width: 50,
        ),
      ),
      title: Text(
        this.getName(this.chat["phoneNo"]),
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        "jiofHJOGGFHJG;MHGFKMHJGFKLHJMGFKLNJGFKLNJGFKLNM ,GFJNGLKJGHLMNJ,GH.MNJGHKLNJGHKLNG",
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 15,
        ),
        overflow: TextOverflow.ellipsis,
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Colors.green[500],
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 1),
        child: Text(
          "26",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
