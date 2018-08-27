import 'package:volleystats/model/group.dart';
import 'package:volleystats/model/tournament.dart';

class TournamentInfo {
  List<Group> groups;
  Tournament tournament;

  TournamentInfo(this.groups);

  TournamentInfo.fromJson(Map<String, dynamic> json) {
    tournament = Tournament.fromJson(json['tournament']);
    groups = (json['groups'] as List).map((i) => Group.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() => {
    'groups': groups,
  };
}
