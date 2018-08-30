import 'package:volleystats/model/category.dart';
import 'package:volleystats/model/season.dart';

class Tournament {
  String id;
  String name;
  Season current_season;
  Category category;

  Tournament(this.id, this.name, this.current_season, this.category);

  Tournament.fromJson(Map<String, dynamic> json)
      : current_season = Season.fromJson(json['current_season']),
        category = Category.fromJson(json['category']),
        id = json['id'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'id': id,
        'current_season': current_season.toJson(),
      };
}
