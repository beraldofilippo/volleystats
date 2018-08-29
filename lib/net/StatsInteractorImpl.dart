import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volleystats/model/livestandings.dart';
import 'package:volleystats/model/tournamentinfo.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/net/SecretLoader.dart';
import 'package:volleystats/net/StatsInteractor.dart';

const String tournamentsURL =
    "http://api.sportradar.com/volleyball-t1/indoor/en/tournaments.json?api_key=";
const String tournamentBasePath =
    "http://api.sportradar.com/volleyball-t1/indoor/en/tournaments/";
const String infoPath = "/info.json?api_key=";
const String standingsPath = "/live_standings.json?api_key=";

class StatsInteractorImpl implements StatsInteractor {
  http.Client client;

  StatsInteractorImpl() {
    client = http.Client();
  }

  Future<Tournaments> fetchTournaments() {
    return SecretLoader(secretPath: "secrets.json")
        .loadSRApiKey()
        .then((secret) => secret)
        .then((secret) => client.get(tournamentsURL + secret.apiKey))
        .then((response) => Tournaments.fromJson(json.decode(response.body)));
  }

  Future<TournamentInfo> fetchTournamentInfo(String tournamentId) {
    return SecretLoader(secretPath: "secrets.json")
        .loadSRApiKey()
        .then((secret) => secret)
        .then((secret) => client.get(tournamentBasePath + tournamentId + infoPath + secret.apiKey))
        .then((response) => TournamentInfo.fromJson(json.decode(response.body)));
  }

  Future<LiveStandings> fetchTournamentStandings(String tournamentId) {
    return SecretLoader(secretPath: "secrets.json")
        .loadSRApiKey()
        .then((secret) => secret)
        .then((secret) => client.get(tournamentBasePath + tournamentId + standingsPath + secret.apiKey))
        .then((response) => LiveStandings.fromJson(json.decode(response.body)));
  }
}
