import 'package:flutter/material.dart';

const double storyRadius = 35;

class AddStory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () {},
        focusColor: Colors.green[100],
        highlightColor: Colors.green[100],
        splashColor: Colors.green[200],
        borderRadius: BorderRadius.circular(13),
        child: Tooltip(
          message: "Add Your Story",
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 13, vertical: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: Icon(
                  Icons.add,
                  color: Colors.green[800],
                  size: storyRadius,
                ),
              ),
            ),
          ),
        ),
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Image(
          image: NetworkImage(
            "https://bit.ly/38sXcEA",
          ),
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
