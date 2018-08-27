import 'package:volleystats/model/team.dart';

class StandingsTeamEntry {
  int rank;
  int played;
  int win;
  int draw;
  int loss;
  int score_for;
  int score_against;
  int score_diff;
  int points;
  int change;
  String current_outcome;
  Team team;

  StandingsTeamEntry(this.rank, this.played, this.win, this.draw, this.loss,
      this.score_for, this.score_against, this.score_diff, this.points, this.change,
      this.current_outcome, this.team);

  StandingsTeamEntry.fromJson(Map<String, dynamic> json)
      : team  = Team.fromJson(json),
        current_outcome = json['current_outcome'],
        rank = json['rank'],
        played = json['played'],
        win = json['win'],
        draw = json['draw'],
        loss = json['loss'],
        score_for = json['score_for'],
        score_against = json['score_against'],
        score_diff = json['score_diff'],
        points = json['points'],
        change = json['change']
  ;

  Map<String, dynamic> toJson() =>
      {
        'team': team,
        'current_outcome': current_outcome,
        'rank': rank,
        'played': played,
        'win': win,
        'draw': draw,
        'loss': loss,
        'score_for': score_for,
        'score_against': score_against,
        'score_diff': score_diff,
        'points': points,
        'change': change
      };
}
