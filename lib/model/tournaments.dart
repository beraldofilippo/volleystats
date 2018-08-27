import 'package:volleystats/model/tournament.dart';

class Tournaments {
  List<Tournament> tournaments;

  Tournaments(this.tournaments);

  Tournaments.fromJson(Map<String, dynamic> json) {
    tournaments = (json['tournaments'] as List).map((i) => Tournament.fromJson(i)).toList();
  }

  Map<String, dynamic> toJson() => {
        'tournaments': tournaments,
      };
}
