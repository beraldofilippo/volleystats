import 'package:flutter/material.dart';

class EmptyPageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("UGH! Nothing to see here."),
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("GO BACK"),
                )
              ])),
    );
  }
}
