import 'package:flutter/material.dart';

class NetworkErrorWidget extends StatelessWidget {
  final Function onTapCallback;

  NetworkErrorWidget({Key key, this.onTapCallback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Something went wrong, hit retry!"),
                FlatButton(
                  onPressed: onTapCallback,
                  child: Text("RETRY"),
                )
              ])),
    );
  }
}
