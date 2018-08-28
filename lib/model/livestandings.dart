import 'package:volleystats/model/standings.dart';

class LiveStandings {
  List<Standings> standings;

  LiveStandings(this.standings);

  LiveStandings.fromJson(Map<String, dynamic> json)
      : standings = (json['standings'] as List)
            .map((i) => Standings.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'standings': standings,
      };
}
