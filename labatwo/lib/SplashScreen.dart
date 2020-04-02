import 'dart:async';
import 'package:flutter/material.dart';
import 'TestAPI.dart';
import 'main.dart';

class SplashScreen extends StatefulWidget {

  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double sideLength = 50;
  ListData a;
  @override
  void initState() {
    super.initState();
    splash().then(
      (status){
        if(status){
          replaceMain(a);
        }
        else{
          print('b');
        }
      }
    );
  }




Future<bool> splash() async{
  try {
    a = await JsonAPI().fetchData();
        if(a != null || a.data != null || a.data.length != 0)
          return true;
        else 
          return false;
    /*if(a != null || a.data != null || a.data.length != 0)
      return true;
    else 
      return false;*/
  } catch (e) {
    print(e.toString());
    return false;
  }
}

void replaceMain(ListData b){
  Navigator.of(context).pushReplacement(createRoute(b));
}

Route createRoute(ListData b){
  return PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => MainApp(data: b),
  transitionsBuilder: (context, animation, secondaryAniomation, child) {
      var begin = Offset(0.1, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
  
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: 
    Container(
      child: Stack(children: <Widget>[
          Opacity(
            opacity: 0.865,
            child: Image.asset("assets/wallpapersden.com_android-robot-glass_1440x2880.jpg")
          ),
          ],)
    ),
  );
}
}