import 'package:flutter/material.dart';
import 'package:memomessenger/Services/Types/MemoMessenger.dart';
import 'package:rxdart/subjects.dart';

TextStyle sectionTitleTextStyle() {
  return TextStyle(
    color: Colors.grey[500],
    fontWeight: FontWeight.w600,
  );
}

TextStyle sectionTitleActiveTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).accentColor,
    fontWeight: FontWeight.w600,
  );
}

final BehaviorSubject<SectionEnum> currentSection =
    new BehaviorSubject.seeded(SectionEnum.Favorites);
final EdgeInsetsGeometry sectionTitlePadding = EdgeInsets.only(right: 20);
