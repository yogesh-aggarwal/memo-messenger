import 'package:flutter/material.dart';

final MaterialColor themeAccentColor = Colors.red;
final ThemeData theme = ThemeData(
  accentColor: themeAccentColor,
  accentColorBrightness: Brightness.light,
  fontFamily: "Poppins",
  appBarTheme: AppBarTheme(
    color: themeAccentColor,
    elevation: 0,
  ),
);
final Function materialAppBuilder = (context, child) {
  return ScrollConfiguration(
    behavior: ScrollBehavior()
      ..buildViewportChrome(context, null, AxisDirection.down),
    child: child,
  );
};
final Color bottomAppBarIconColor = themeAccentColor[800];
final double messageBorderRadius = 10;
final TextStyle bottomAppBarIconLabelTextStyle =
    TextStyle(color: themeAccentColor[800], fontWeight: FontWeight.bold);

final EdgeInsetsGeometry lrPadding = EdgeInsets.symmetric(horizontal: 15);
