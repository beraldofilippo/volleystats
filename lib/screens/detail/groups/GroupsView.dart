import 'package:volleystats/arch/BaseView.dart';
import 'package:volleystats/model/tournamentinfo.dart';

abstract class GroupsView extends BaseView {
  void showGroups(TournamentInfo result);
  void showError(e);
}