import 'package:flutter/material.dart';
import 'package:volleystats/screens/tournamentspage.dart';
import 'package:volleystats/style/theme.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Volleystats',
      theme: getThemeData(),
      home: new TournamentsPage(title: 'Tournaments'),
    );
  }
}
