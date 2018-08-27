import 'package:volleystats/model/standingsteamentry.dart';

class StandingsGroup {
  String name;
  List<StandingsTeamEntry> team_standings;

  StandingsGroup(this.name, this.team_standings);

  StandingsGroup.fromJson(Map<String, dynamic> json)
      : team_standings = (json['team_standings'] as List).map((i) => StandingsTeamEntry.fromJson(i)).toList(),
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'team_standings': team_standings,
        'name': name,
      };
}
