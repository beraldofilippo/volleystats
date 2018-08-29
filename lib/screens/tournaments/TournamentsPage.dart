import 'package:flutter/material.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/screens/tournaments/TournamentsPagePresenter.dart';
import 'package:volleystats/screens/tournaments/TournamentsView.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/TournamentsGrid.dart';
import 'package:volleystats/widget/WidgetUtil.dart';

class TournamentsPage extends StatefulWidget {
  TournamentsPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _TournamentsPageState createState() => new _TournamentsPageState();
}

class _TournamentsPageState extends State<TournamentsPage>
    implements TournamentsView {
  bool isLoading = true;
  bool isError = false;
  Tournaments tournaments;
  TournamentsPagePresenter presenter;

  _TournamentsPageState() {
    presenter = TournamentsPagePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    resetState();
  }

  void resetState() {
    isLoading = true;
    isError = false;
    presenter.getTournaments();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(body: createView());
  }

  @override
  Widget createView() {
    if (isError) {
      return NetworkErrorWidget(onTapCallback: () => setState(() {resetState();}));
    } else if (isLoading) {
      return getProgressDialog();
    } else {
      return TournamentsGrid(tournaments: tournaments);
    }
  }

  @override
  void showError(e) {
    setState(() {
      tournaments = null;
      isLoading = false;
      isError = true;
    });
  }

  @override
  void showTournaments(Tournaments result) {
    setState(() {
      tournaments = result;
      isLoading = false;
      isError = false;
    });
  }
}
