import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/MemoMessenger/Constants.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';

class GroupsWidget extends StatefulWidget {
  @override
  _GroupsWidgetState createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: currentSection.value,
      stream: currentSection.stream,
      builder: (context, snapshot) {
        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: lrPadding,
          child: Row(
            children: [
              Container(
                padding: sectionTitlePadding,
                child: GestureDetector(
                  onTap: () {
                    currentSection.add(SectionEnum.Favorites);
                  },
                  child: Text(
                    "Favorites",
                    style: snapshot.data == SectionEnum.Favorites
                        ? sectionTitleActiveTextStyle(context)
                        : sectionTitleTextStyle(),
                  ),
                ),
              ),
              Container(
                padding: sectionTitlePadding,
                child: GestureDetector(
                  onTap: () {
                    currentSection.add(SectionEnum.Family);
                  },
                  child: Text(
                    "Family",
                    style: snapshot.data == SectionEnum.Family
                        ? sectionTitleActiveTextStyle(context)
                        : sectionTitleTextStyle(),
                  ),
                ),
              ),
              Container(
                padding: sectionTitlePadding,
                child: GestureDetector(
                  onTap: () {
                    currentSection.add(SectionEnum.Office);
                  },
                  child: Text(
                    "Office",
                    style: snapshot.data == SectionEnum.Office
                        ? sectionTitleActiveTextStyle(context)
                        : sectionTitleTextStyle(),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
