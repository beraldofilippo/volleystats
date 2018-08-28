import 'package:flutter/material.dart';
import 'package:volleystats/model/tournamentinfo.dart';

class GroupsGrid extends StatelessWidget {
  final TournamentInfo tournamentInfo;

  GroupsGrid({Key key, this.tournamentInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200.0,
      ),
      itemCount: tournamentInfo.groups.length,
      itemBuilder: (context, index) {
//        if(tournamentInfo.groups.length == 0) // TODO provide empty page state
        return InkWell(
            child: Card(
                child: new Center(
                    child: new Container(
          margin: const EdgeInsets.all(10.0),
          child: new Column(children: <Widget>[
            Text(
              "Group " + tournamentInfo.groups[index].name,
            ),
          ]),
        ))));
      },
    );
  }
}
