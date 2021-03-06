import 'package:flutter/material.dart';
import 'package:volleystats/screens/detail/TournamentDetailPage.dart';

launchTournamentDetail(BuildContext context, String id) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) => TournamentDetailPage(tournamentId: id),
    settings: RouteSettings(name: TournamentDetailPage.routeName)
  ));
}