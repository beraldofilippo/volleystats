import 'package:volleystats/arch/BaseView.dart';
import 'package:volleystats/model/tournaments.dart';

abstract class TournamentsView extends BaseView {
  void showTournaments(Tournaments result);
  void showError(e);
}