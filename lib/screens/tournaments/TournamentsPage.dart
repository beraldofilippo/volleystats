import 'package:flutter/material.dart';
import 'package:volleystats/model/tournaments.dart';
import 'package:volleystats/screens/tournaments/TournamentsPagePresenter.dart';
import 'package:volleystats/screens/tournaments/TournamentsView.dart';
import 'package:volleystats/style/theme.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/TournamentsGrid.dart';
import 'package:volleystats/widget/WidgetUtil.dart';

class TournamentsPage extends StatefulWidget {
  TournamentsPage({Key key, this.title}) : super(key: key);

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
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        centerTitle: true,
        textTheme: getAppBarTextTheme(),
      ),
      body: createView(),
    );
  }

  @override
  Widget createView() {
    if (isError) {
      return NetworkErrorWidget(
          onTapCallback: () => setState(() {
                resetState();
              }));
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
