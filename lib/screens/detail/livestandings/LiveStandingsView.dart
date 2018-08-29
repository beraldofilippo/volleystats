import 'package:volleystats/arch/BaseView.dart';
import 'package:volleystats/model/livestandings.dart';

abstract class LiveStandingsView extends BaseView {
  void showLiveStandings(LiveStandings result);
  void showError(e);
}