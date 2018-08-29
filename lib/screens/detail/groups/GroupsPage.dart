import 'package:flutter/material.dart';
import 'package:volleystats/model/tournamentinfo.dart';
import 'package:volleystats/screens/detail/DetailPage.dart';
import 'package:volleystats/screens/detail/groups/GroupsPagePresenter.dart';
import 'package:volleystats/screens/detail/groups/GroupsView.dart';
import 'package:volleystats/widget/ErrorWidget.dart';
import 'package:volleystats/widget/GroupsGrid.dart';
import 'package:volleystats/widget/WidgetUtil.dart';

class GroupsPage extends StatefulWidget {
  GroupsPage({Key key, this.title, this.detailPage}) : super(key: key);

  final String title;
  final DetailPage detailPage;

  @override
  _GroupsPageState createState() => new _GroupsPageState(detailPage);
}

class _GroupsPageState extends State<GroupsPage> implements GroupsView {
  bool isLoading = true;
  bool isError = false;
  TournamentInfo info;

  GroupsPagePresenter presenter;

  _GroupsPageState(DetailPage detailPage) {
    presenter = new GroupsPagePresenter(this, detailPage.getTournamentId());
  }

  @override
  void initState() {
    super.initState();
    isLoading = true;
    isError = false;

    presenter.getTournamentInfo();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: createView()// This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  Widget createView() {
    if (isError) {
      return NetworkErrorWidget(onTapCallback: () => setState(() {}));
    } else if (isLoading) {
      return getProgressDialog();
    } else {
      return GroupsGrid(tournamentInfo: info);
    }
  }

  @override
  void showError(e) {
    setState(() {
      info = null;
      isLoading = false;
      isError = true;
    });
  }

  @override
  void showGroups(TournamentInfo result) {
    setState(() {
      info = result;
      isLoading = false;
      isError = false;
    });
  }
}