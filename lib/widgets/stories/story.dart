import 'package:flutter/material.dart';

const double storyRadius = 35;

class AddStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: CircleAvatar(
        backgroundColor: Colors.green[50],
        child: Icon(
          Icons.add,
          color: Colors.black,
          size: storyRadius,
        ),
        radius: storyRadius,
      ),
    );
  }
}

class Story extends StatefulWidget {
  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.015,
      ),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          "https://bit.ly/38sXcEA",
        ),
        radius: storyRadius,
      ),
    );
  }
}
