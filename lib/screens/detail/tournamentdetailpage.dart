import 'package:flutter/material.dart';
import 'package:volleystats/screens/detail/detailpage.dart';
import 'package:volleystats/screens/detail/groupspage.dart';
import 'package:volleystats/screens/detail/livestandingspage.dart';

class NavigationIconView {
  NavigationIconView({
    Widget icon,
    Widget activeIcon,
    String title,
    Color color,
    TickerProvider vsync,
  })  : _icon = icon,
        _color = color,
        _title = title,
        item = new BottomNavigationBarItem(
          icon: icon,
          activeIcon: activeIcon,
          title: new Text(title),
          backgroundColor: color,
        ),
        controller = new AnimationController(
          duration: kThemeAnimationDuration,
          vsync: vsync,
        ) {
    _animation = new CurvedAnimation(
      parent: controller,
      curve: const Interval(0.5, 1.0, curve: Curves.fastOutSlowIn),
    );
  }

  final Widget _icon;
  final Color _color;
  final String _title;
  final BottomNavigationBarItem item;
  final AnimationController controller;
  CurvedAnimation _animation;

  FadeTransition transition(
      BottomNavigationBarType type, BuildContext context) {
    Color iconColor;
    if (type == BottomNavigationBarType.shifting) {
      iconColor = _color;
    } else {
      final ThemeData themeData = Theme.of(context);
      iconColor = themeData.brightness == Brightness.light
          ? themeData.primaryColor
          : themeData.accentColor;
    }

    return new FadeTransition(
      opacity: _animation,
      child: new SlideTransition(
        position: new Tween<Offset>(
          begin: const Offset(0.0, 0.02), // Slightly down.
          end: Offset.zero,
        ).animate(_animation),
        child: new IconTheme(
          data: new IconThemeData(
            color: iconColor,
            size: 120.0,
          ),
          child: new Semantics(
            label: 'Placeholder for $_title tab',
            child: _icon,
          ),
        ),
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
      margin: const EdgeInsets.all(4.0),
      width: iconTheme.size - 8.0,
      height: iconTheme.size - 8.0,
      color: iconTheme.color,
    );
  }
}

class CustomInactiveIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final IconThemeData iconTheme = IconTheme.of(context);
    return new Container(
        margin: const EdgeInsets.all(4.0),
        width: iconTheme.size - 8.0,
        height: iconTheme.size - 8.0,
        decoration: new BoxDecoration(
          border: new Border.all(color: iconTheme.color, width: 2.0),
        ));
  }
}

class TournamentDetailPage extends StatefulWidget implements DetailPage {
  static const String routeName = '/tournamentdetail';
  final String tournamentId;

  TournamentDetailPage({Key key, @required this.tournamentId})
      : super(key: key);

  @override
  _TournamentDetailPageState createState() => new _TournamentDetailPageState();

  @override
  getTournamentId() {
    return tournamentId;
  }
}

class _TournamentDetailPageState extends State<TournamentDetailPage>
    with TickerProviderStateMixin {
  int _currentIndex = 0;
  BottomNavigationBarType _type = BottomNavigationBarType.fixed;
  List<NavigationIconView> _navigationViews;

  @override
  void initState() {
    super.initState();
    _navigationViews = <NavigationIconView>[
      new NavigationIconView(
        icon: const Icon(Icons.apps),
        title: 'Groups',
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.av_timer),
        title: 'Live',
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.event_available),
        title: 'Results',
        vsync: this,
      ),
      new NavigationIconView(
        icon: const Icon(Icons.event),
        title: 'Schedule',
        vsync: this,
      )
    ];

    for (NavigationIconView view in _navigationViews)
      view.controller.addListener(_rebuild);

    _navigationViews[_currentIndex].controller.value = 1.0;
  }

  @override
  void dispose() {
    for (NavigationIconView view in _navigationViews) view.controller.dispose();
    super.dispose();
  }

  void _rebuild() {
    setState(() {
      // Rebuild in order to animate views.
    });
  }

  getCurrentPageBody() {
    switch (_currentIndex) {
      case 0:
        return new GroupsPage(title: "Groups", detailPage: widget);
      case 1:
        return new LiveStandingsPage(title: "Live Standings", detailPage: widget);
      default:
        return new GroupsPage(title: "Groups", detailPage: widget);
    }
  }

  @override
  Widget build(BuildContext context) {
    final BottomNavigationBar botNavBar = new BottomNavigationBar(
      items: _navigationViews
          .map((NavigationIconView navigationView) => navigationView.item)
          .toList(),
      currentIndex: _currentIndex,
      type: _type,
      onTap: (int index) {
        if(index == _currentIndex) return; // Avoid rebuilding interface on clicking same tab
        setState(() {
          _navigationViews[_currentIndex].controller.reverse();
          _currentIndex = index;
          _navigationViews[_currentIndex].controller.forward();
        });
      },
    );

    return new Scaffold(
      body: new Center(child: getCurrentPageBody()),
      bottomNavigationBar: botNavBar,
    );
  }
}
