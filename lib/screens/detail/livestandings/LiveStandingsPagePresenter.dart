import 'package:volleystats/net/StatsInteractor.dart';
import 'package:volleystats/net/StatsInteractorImpl.dart';
import 'package:volleystats/screens/detail/livestandings/LiveStandingsView.dart';

class LiveStandingsPagePresenter {
  String tournamentId;
  LiveStandingsView view;
  StatsInteractor interactor;

  LiveStandingsPagePresenter(this.view, this.tournamentId) {
    interactor = new StatsInteractorImpl();
  }

  void getLiveStandings() {
    interactor
        .fetchTournamentStandings(tournamentId)
        .then((standings) => view.showLiveStandings(standings))
        .catchError((e) => view.showError(e));
  }
}