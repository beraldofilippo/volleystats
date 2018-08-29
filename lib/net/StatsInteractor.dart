import 'dart:async';
import 'package:volleystats/model/livestandings.dart';
import 'package:volleystats/model/tournamentinfo.dart';
import 'package:volleystats/model/tournaments.dart';

abstract class StatsInteractor {
  Future<Tournaments> fetchTournaments();

  Future<TournamentInfo> fetchTournamentInfo(String tournamentId);

  Future<LiveStandings> fetchTournamentStandings(String tournamentId);
}