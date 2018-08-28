import 'package:flutter/material.dart';
import 'package:volleystats/style/colors.dart';

final ThemeData themeData =
    new ThemeData(
        primarySwatch: ThemeColors.getSwatch(),
        fontFamily: 'Nunito');

ThemeData getThemeData() {
  return themeData;
}
