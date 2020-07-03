import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:falcon/services/data.service.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic profile;

  getProfile() async {
    this.profile = {
      "name": "Yogesh Aggarwal",
      "status": "Be happy!",
      "profileImg": "https://bit.ly/31FmUUJ",
      "coverImg": "https://bit.ly/2VKOPiy",
    };
  }

  @override
  Widget build(BuildContext context) {
    if (this.profile == null) {
      this.getProfile();
    }

    print(this.profile);

    return this.profile != null
        ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
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
          )
        : Container(child: Data.linearProgress);
  }
}
