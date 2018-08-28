import 'package:flutter/material.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/navigator.dart';
import 'package:volleystats/widget/EmptyPageWidget.dart';

class TournamentsGrid extends StatelessWidget {
  final Tournaments tournaments;

  TournamentsGrid({Key key, this.tournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
      ),
      itemCount: tournaments.tournaments.length,
      itemBuilder: (context, index) {
        if (tournaments.tournaments.length != null && tournaments.tournaments.length == 0) {
          return new EmptyPageWidget();
        } else {
          return InkWell(
              onTap: () => launchTournamentDetail(
                  context, tournaments.tournaments[index].id),
              child: Card(
                  child: new Center(
                      child: new Container(
                margin: const EdgeInsets.all(10.0),
                child: new Column(children: <Widget>[
                  Text(
                    tournaments.tournaments[index].name,
                  ),
                ]),
              ))));
        }
      },
    );
  }
}
