import 'package:flutter/material.dart';
import 'main.dart';
import 'TestAPI.dart';





class SecondScreen extends StatelessWidget {
  final ListData data;
  const SecondScreen({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: Center(
            child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            backGround(size),
          ],
            ),
        ),
      );
  }
}