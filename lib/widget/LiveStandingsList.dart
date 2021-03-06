import 'package:flutter/material.dart';
import 'package:volleystats/model/livestandings.dart';
import 'package:volleystats/model/standingsteamentry.dart';
import 'package:volleystats/widget/EmptyPageWidget.dart';

class LiveStandingsList extends StatelessWidget {
  final LiveStandings livestandings;

  LiveStandingsList({Key key, this.livestandings}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (livestandings.standings != null &&
        livestandings.standings.length == 0) {
      return new EmptyPageWidget();
    } else {
      List<Widget> tiles = List<Widget>();

      for (var standings in livestandings.standings) {
        for (var standingsgroup in standings.groups) {
          var secondaryTiles = List<Widget>();
          secondaryTiles.add(buildListTileRowLabels());
          for (var standingsteamentry in standingsgroup.team_standings) {
            secondaryTiles.add(buildListTileRow(standingsteamentry));
          }
          tiles.add(new ExpansionTile(
            leading: new ExcludeSemantics(
                child: new CircleAvatar(
                    radius: 20.0, child: new Text(standingsgroup.group_name))),
            title: new Text(standingsgroup.name),
            initiallyExpanded: true,
            children: secondaryTiles,
          ));
        }
      }

      List<Widget> listTilesReady =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return new Scaffold(
        body: new Scrollbar(
          child: new ListView(
            padding: new EdgeInsets.symmetric(vertical: 4.0),
            children: listTilesReady,
          ),
        ),
      );
    }
  }

  buildListTileRow(StandingsTeamEntry standingsteamentry) {
    return new ListTile(
      title: new Row(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.all(1.0),
              child: new CircleAvatar(
                  radius: 12.0,
                  child: new Text(standingsteamentry.rank.toString()))),
          new Expanded(
            child: new Text(standingsteamentry.team.name.substring(0, 3),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.points.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.played.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.win.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.draw.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.loss.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.score_for.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.score_against.toString(),
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text(standingsteamentry.score_diff.toString(),
                textAlign: TextAlign.center),
          ),
//          new Expanded(
//            child: new FittedBox(
//              fit: BoxFit.contain, // otherwise the logo will be tiny
//              child: const FlutterLogo(),
//            ),
//          ),
        ],
      ),
    );
  }

  buildListTileRowLabels() {
    return new ListTile(
      title: new Row(
        children: <Widget>[
          new Padding(
              padding: EdgeInsets.all(1.0),
              child: new CircleAvatar(
                  radius: 12.0)),
          new Expanded(
            child: new Text("   ",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("Pts",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("Pld",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("W",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("D",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("L",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("For",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("Ags",
                textAlign: TextAlign.center),
          ),
          new Expanded(
            child: new Text("Dif",
                textAlign: TextAlign.center),
          ),
//          new Expanded(
//            child: new FittedBox(
//              fit: BoxFit.contain, // otherwise the logo will be tiny
//              child: const FlutterLogo(),
//            ),
//          ),
        ],
      ),
    );
  }
}
