import 'package:volleystats/model/season.dart';

class Tournament {
  String id;
  String name;
  Season current_season;

  Tournament(this.id, this.name, this.current_season);

  Tournament.fromJson(Map<String, dynamic> json)
      : current_season = Season.fromJson(json['current_season']),
        id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'id': id,
        'current_season': current_season.toJson(),
      };
}
