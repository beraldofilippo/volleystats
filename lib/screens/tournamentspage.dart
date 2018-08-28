import 'package:flutter/material.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/net/network.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/TournamentsGrid.dart';
import 'package:http/http.dart' as http;
import 'package:volleystats/widget/WidgetUtil.dart';

class TournamentsPage extends StatefulWidget {
  TournamentsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TournamentsPageState createState() => new _TournamentsPageState();
}

class _TournamentsPageState extends State<TournamentsPage> {
  Tournaments _tournaments;

  getBody() {
    return FutureBuilder<Tournaments>(
      future: fetchTournaments(http.Client()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return getProgressDialog();
          default:
            if (snapshot.hasError) {
              return NetworkErrorWidget(onTapCallback: () => setState(() {}));
            } else if (snapshot.hasData) {
              _tournaments = snapshot.data;
            }

            return _tournaments != null
                ? TournamentsGrid(tournaments: snapshot.data)
                : NetworkErrorWidget(onTapCallback: () => setState(() {}));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
        body: getBody());
  }
}