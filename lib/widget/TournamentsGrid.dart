import 'package:flutter/material.dart';
import 'package:volleystats/model/tournament.dart';
import 'package:volleystats/navigator.dart';
import 'package:volleystats/widget/EmptyPageWidget.dart';

class TournamentsGrid extends StatelessWidget {
  final List<Tournament> tournamentList;

  TournamentsGrid({Key key, this.tournamentList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
      ),
      itemCount: tournamentList.length,
      itemBuilder: (context, index) {
        if (tournamentList.length != null && tournamentList.length == 0) {
          return new EmptyPageWidget();
        } else {
          return getCard(context, tournamentList[index]);
        }
      },
    );
  }

  Card getCard(BuildContext context, Tournament tournament) {
    return Card(
      child: InkWell(
        onTap: () =>
            launchTournamentDetail(context, tournament.id),
        child: new Center(
          child: new Container(
            margin: const EdgeInsets.all(10.0),
            child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Stack(
                    children: <Widget>[
                      Text(
                        tournament.name,
                      ),
                    ],
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
