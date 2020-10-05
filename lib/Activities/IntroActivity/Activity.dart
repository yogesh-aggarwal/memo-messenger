import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/SignupActivity/Activity.dart';
import 'package:memomessenger/Services/Constants.dart';

class IntroActivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage("assets/illustrations/send_message.png"),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: lrPadding,
                    child: Text(
                      "Let's Get Started",
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 50,
                      ),
                    ),
                  ),
                  Container(
                    padding: lrPadding,
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      "Everything Works Better Together!",
                      overflow: TextOverflow.clip,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FlatButton(
                          padding: EdgeInsets.symmetric(vertical: 20),
                          color: Theme.of(context).accentColor,
                          minWidth: MediaQuery.of(context).size.width -
                              lrPadding.horizontal,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          onPressed: () {
                            print("Get Started");
                            Navigator.of(context).push(CupertinoPageRoute(
                              builder: (context) {
                                return SignupActivity();
                              },
                            ));
                          },
                          child: Text(
                            "Get Started",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
