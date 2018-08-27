import 'package:volleystats/model/team.dart';

class Group {
  String name;
  List<Team> teams;

  Group(this.name, this.teams);

  Group.fromJson(Map<String, dynamic> json)
      : teams  = (json['teams'] as List).map((i) => Team.fromJson(i)).toList(),
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'teams': teams,
        'name': name,
      };
}
