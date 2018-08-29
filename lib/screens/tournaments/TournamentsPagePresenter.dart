import 'package:volleystats/net/StatsInteractor.dart';
import 'package:volleystats/net/StatsInteractorImpl.dart';
import 'package:volleystats/screens/tournaments/TournamentsView.dart';

class TournamentsPagePresenter {
  TournamentsView view;
  StatsInteractor interactor;

  TournamentsPagePresenter(this.view) {
    interactor = StatsInteractorImpl();
  }

  void getTournaments() {
    interactor
        .fetchTournaments()
        .then((tournaments) => view.showTournaments(tournaments))
        .catchError((e) => view.showError(e));
  }
}
