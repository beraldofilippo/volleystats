import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    platform: TargetPlatform.fuchsia,
    primarySwatch: Colors.red,
    fontFamily: 'Nunito');

ThemeData getThemeData() {
  return themeData;
}

TextTheme getAppBarTextTheme() {
  return Typography(platform: TargetPlatform.fuchsia)
      .white
      .copyWith(title: TextStyle(fontFamily: 'LeagueScript', fontSize: 40.0));
}
