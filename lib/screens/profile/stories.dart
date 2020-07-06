import 'package:memomessenger/screens/profile/story.dart';
import 'package:flutter/material.dart';

class Stories extends StatefulWidget {
  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  var stories = [
    {"hello": "world"}
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: this.stories.length,
        itemBuilder: (context, index) {
          return Story(this.stories[index]);
        },
      ),
    );
  }
}
