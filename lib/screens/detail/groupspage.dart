import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:volleystats/model/tournamentinfo.dart';
import 'package:volleystats/net/network.dart';
import 'package:volleystats/screens/detail/detailpage.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/GroupsGrid.dart';
import 'package:volleystats/widget/WidgetUtil.dart';

class GroupsPage extends StatefulWidget {
  GroupsPage({Key key, this.title, this.detailPage}) : super(key: key);

  final String title;
  final DetailPage detailPage;

  @override
  _GroupsPageState createState() => new _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  TournamentInfo _tournamentInfo;

  getBody() {
    return FutureBuilder<TournamentInfo>(
      future: fetchTournamentInfo(http.Client(), widget.detailPage.getTournamentId()),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return getProgressDialog();
          default:
            if (snapshot.hasError) {
              return NetworkErrorWidget(onTapCallback: () => setState(() {}));
            } else if (snapshot.hasData) {
              _tournamentInfo = snapshot.data;
            }

            return _tournamentInfo != null
                ? GroupsGrid(tournamentInfo: snapshot.data)
                : NetworkErrorWidget(onTapCallback: () => setState(() {}));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: getBody()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}