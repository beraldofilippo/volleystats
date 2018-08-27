import 'package:volleystats/model/standingsgroup.dart';

class Standings {
  List<StandingsGroup> groups;

  Standings(this.groups);

  Standings.fromJson(Map<String, dynamic> json) :
        groups  = (json['groups'] as List).map((i) => StandingsGroup.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
    'groups': groups,
  };
}
