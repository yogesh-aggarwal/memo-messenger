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
    return StreamBuilder<List<String>>(
      initialData: sections.value,
      stream: sections.stream,
      builder: (context, sectionsValue) {
        return StreamBuilder<String>(
          initialData: currentSection.value,
          stream: currentSection.stream,
          builder: (context, currentSectionValue) {
            print(currentSection.value);
            return SizedBox(
              width: double.infinity,
              height: 20,
              child: ListView.builder(
                shrinkWrap: true,
                padding: lrPadding,
                physics: BouncingScrollPhysics(),
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
