import 'package:flutter/material.dart';

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

final EdgeInsetsGeometry sectionTitlePadding = EdgeInsets.only(right: 20);
