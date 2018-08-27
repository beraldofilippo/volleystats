import 'package:flutter/material.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/navigator.dart';

class TournamentList extends StatelessWidget {
  final Tournaments tournaments;

  TournamentList({Key key, this.tournaments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
      ),
      itemCount: tournaments.tournaments.length,
      itemBuilder: (context, index) {
        return InkWell(
            onTap: () => launchTournamentDetail(context, tournaments.tournaments[index].id),
            child: Card(
                child: new Center(
                    child: new Container(
              margin: const EdgeInsets.all(10.0),
              child: new Column(children: <Widget>[
                Image.asset("assets/icons/ic_volleyball.png"),
                Text(
                  tournaments.tournaments[index].name,
                ),
              ]),
            ))));
      },
    );
  }
}
