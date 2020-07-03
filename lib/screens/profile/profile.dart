import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic profile;

  getProfile() async {
    this.profile = {
      "name": "Yogesh Aggarwal",
      "status": "Coding is Everything!",
      "profileImg": "https://bit.ly/31FmUUJ",
      "coverImg": "https://bit.ly/2VKOPiy",
    };
  }

  @override
  Widget build(BuildContext context) {
    if (this.profile == null) {
      this.getProfile();
    }

    return this.profile != null
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Container(
                  child: ColumnSuper(
                    innerDistance: -80,
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: NetworkImage(this.profile["coverImg"]),
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.width * .45,
                            width: MediaQuery.of(context).size.width * .45,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 5,
                                color: Colors.green[100],
                              ),
                              borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.width * .06,
                              ),
                              image: DecorationImage(
                                image: NetworkImage(this.profile["profileImg"]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    this.profile["name"],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 32,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  margin: EdgeInsets.only(top: 2),
                  child: Text(
                    this.profile["status"],
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
              ],
            ),
          )
        : Container(child: Data.linearProgress);
  }
}
