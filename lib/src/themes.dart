import 'package:flutter/material.dart';

final ThemeData defaultTheme = buildDefaultTheme();

ThemeData buildDefaultTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    textTheme: buildDefaultTextTheme(base.textTheme),
    primaryTextTheme: buildDefaultTextTheme(base.primaryTextTheme),
    accentTextTheme: buildDefaultTextTheme(base.accentTextTheme),
    backgroundColor: Colors.white, 
    primaryColor: Color.fromRGBO(33,206,153,1),
  );
}

TextTheme buildDefaultTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 30.0,
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  );
}