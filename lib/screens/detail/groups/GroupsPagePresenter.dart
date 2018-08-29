import 'package:volleystats/net/StatsInteractor.dart';
import 'package:volleystats/net/StatsInteractorImpl.dart';
import 'package:volleystats/screens/detail/groups/GroupsView.dart';

class GroupsPagePresenter {
  String tournamentId;
  GroupsView view;
  StatsInteractor interactor;

  GroupsPagePresenter(this.view, this.tournamentId) {
    interactor = new StatsInteractorImpl();
  }

  void getTournamentInfo() {
    interactor
        .fetchTournamentInfo(tournamentId)
        .then((info) => view.showGroups(info))
        .catchError((e) => view.showError(e));
  }
}