import 'package:flutter/material.dart';

final ThemeData themeData = new ThemeData(
    platform: TargetPlatform.fuchsia,
    primarySwatch: Colors.red,
    fontFamily: 'Nunito');

ThemeData getThemeData() {
  return themeData;
}
