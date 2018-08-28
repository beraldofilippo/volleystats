import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:volleystats/model/livestandings.dart';
import 'package:volleystats/model/tournamentinfo.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/net/SecretLoader.dart';

String tournamentsURL =
    "http://api.sportradar.com/volleyball-t1/indoor/en/tournaments.json?api_key=";

String tournamentBasePath = "http://api.sportradar.com/volleyball-t1/indoor/en/tournaments/";
String infoPath = "/info.json?api_key=";
String standingsPath = "/live_standings.json?api_key=";

Future<Tournaments> fetchTournaments(http.Client client) async {
  Secret secret = await SecretLoader(secretPath: "secrets.json").loadSRApiKey();
  final response = await client.get(tournamentsURL + secret.apiKey);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    try {
      return Tournaments.fromJson(json.decode(response.body));
    } catch (e) {
      print(e.toString());
    }
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load Tournaments ' + response.reasonPhrase);
  }
}

Future<TournamentInfo> fetchTournamentInfo(http.Client client, String tournamentId) async {
  Secret secret = await SecretLoader(secretPath: "secrets.json").loadSRApiKey();
  final response = await client.get(tournamentBasePath + tournamentId + infoPath + secret.apiKey);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    try {
      return TournamentInfo.fromJson(json.decode(response.body));
    } catch (e) {
      print(e.toString());
    }
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load TournamentInfo ' + response.reasonPhrase);
  }
}

Future<LiveStandings> fetchTournamentStandings(http.Client client, String tournamentId) async {
  Secret secret = await SecretLoader(secretPath: "secrets.json").loadSRApiKey();
  final response = await client.get(tournamentBasePath + tournamentId + standingsPath + secret.apiKey);

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON
    try {
      return LiveStandings.fromJson(json.decode(response.body));
    } catch (e) {
      print(e.toString());
    }
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load Standings ' + response.reasonPhrase);
  }
}
