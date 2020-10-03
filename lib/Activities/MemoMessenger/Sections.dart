import 'package:flutter/material.dart';
import 'package:memomessenger/Activities/MemoMessenger/Constants.dart';
import 'package:memomessenger/Services/Constants.dart';
import 'package:memomessenger/Services/MemoMessenger.dart';

class SectionsWidget extends StatefulWidget {
  @override
  _SectionsWidgetState createState() => _SectionsWidgetState();
}

class _SectionsWidgetState extends State<SectionsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: sections.value,
      stream: sections.stream,
      builder: (context, sectionsValue) {
        print(sectionsValue.data);
        return StreamBuilder(
          initialData: currentSection.value,
          stream: currentSection.stream,
          builder: (context, currentSectionValue) {
            return Expanded(
              child: ListView.builder(
                padding: lrPadding,
                scrollDirection: Axis.horizontal,
                itemCount: sectionsValue.data.length,
                itemBuilder: (context, index) {
                  String section = sectionsValue.data[index];
                  return Container(
                    padding: sectionTitlePadding,
                    child: GestureDetector(
                      onTap: () {
                        currentSection.add(section);
                      },
                      child: Text(
                        section,
                        style: currentSectionValue.data == section
                            ? sectionTitleActiveTextStyle(context)
                            : sectionTitleTextStyle(),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
