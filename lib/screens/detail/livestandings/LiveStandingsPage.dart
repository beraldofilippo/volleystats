import 'package:flutter/material.dart';
import 'package:volleystats/model/livestandings.dart';
import 'package:volleystats/screens/detail/DetailPage.dart';
import 'package:volleystats/screens/detail/livestandings/LiveStandingsPagePresenter.dart';
import 'package:volleystats/screens/detail/livestandings/LiveStandingsView.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/LiveStandingsList.dart';
import 'package:volleystats/widget/WidgetUtil.dart';

class LiveStandingsPage extends StatefulWidget {
  LiveStandingsPage({Key key, this.title, this.detailPage}) : super(key: key);

  final String title;
  final DetailPage detailPage;

  @override
  _LiveStandingsPageState createState() =>
      new _LiveStandingsPageState(detailPage);
}

class _LiveStandingsPageState extends State<LiveStandingsPage>
    implements LiveStandingsView {
  bool isLoading = true;
  bool isError = false;
  LiveStandings standings;

  LiveStandingsPagePresenter presenter;

  _LiveStandingsPageState(DetailPage detailPage) {
    presenter = LiveStandingsPagePresenter(this, detailPage.getTournamentId());
  }

  @override
  void initState() {
    super.initState();
    resetState();
  }

  void resetState() {
    isLoading = true;
    isError = false;

    presenter.getLiveStandings();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text(widget.title)),
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
      return LiveStandingsList(livestandings: standings);
    }
  }

  @override
  void showError(e) {
    setState(() {
      standings = null;
      isLoading = false;
      isError = true;
    });
  }

  @override
  void showLiveStandings(LiveStandings result) {
    setState(() {
      standings = result;
      isLoading = false;
      isError = false;
    });
  }
}
