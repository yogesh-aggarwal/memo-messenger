import 'package:flutter/material.dart';

TextStyle sectionTitleTextStyle(BuildContext context) {
  return TextStyle(
    color: Theme.of(context).accentColor,
    fontWeight: FontWeight.w600,
  );
}

final EdgeInsetsGeometry sectionTitlePadding = EdgeInsets.only(right: 10);
