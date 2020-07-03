import 'package:flutter/material.dart';

class Story extends StatefulWidget {
  var story;

  Story(var story) {
    this.story = story;
  }

  @override
  _StoryState createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    var story = widget.story;

    return Container(
      child: Text(story["hello"]),
    );
  }
}
