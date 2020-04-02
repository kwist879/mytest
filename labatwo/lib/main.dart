import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'SecondScreen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'SplashScreen.dart';
import 'TestAPI.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(fontFamily: 'Raleway'),
        title: 'Welcome futter',
        home: Scaffold(body: SplashScreen()));
  }
}

class MainApp extends StatelessWidget {
  final ListData data;
  const MainApp({Key key, this.data}) : super(key: key);

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
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                    centerTitle: true,
                    expandedHeight: 150,
                    backgroundColor: Colors.transparent,
                    flexibleSpace: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Лабораторная работа 2',
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white)),
                          Text('Соловьев И.И',
                              style:
                                  TextStyle(fontSize: 22, color: Colors.white)),
                          Text('ИКБО-03-18',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white)),
                        ],
                      ),
                    )),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                      return GradientCard(
                          gradient: LinearGradient(colors: [
                            
                            Color.fromARGB(100, 92, 51, 255),
                            Color.fromARGB(100, 181, 32, 255)
                          ],),
                          margin: EdgeInsets.only(
                              bottom: 1, top: 2, left: 17),
                          shape:
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(41)),
                           ),
                          
                          child: ListTile(
                              onTap: () => Navigator.of(context).push(
                                  CupertinoPageRoute(
                                      builder: (BuildContext context) =>
                                          SecondScreen(data: data))),
                              contentPadding: EdgeInsets.only(
                                  left: 25, top: 25, bottom: 25),
                              title: Text(
                                data.data[index].name,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    fontSize: 21, color: Colors.white60),
                              ),
                              leading: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(21),
                                      topRight: Radius.circular(11),
                                      bottomRight: Radius.circular(11),
                                      topLeft: Radius.circular(11)),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          '${JsonAPI.imageURL}${data.data[index].graphic}',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Container(padding: EdgeInsets.only(left: 18, right: 19), child: Icon(Icons.error_outline)),
                                      height: 64,
                                      width: 64,
                                      fit: BoxFit.fill)
                              )
                          )
                        );
                  },
                  childCount: data.data.length,
                  )
                )
              ],
            ),
          ],
        )
      )
    );
  }
}


Widget backGround(size){
  return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(184, 78, 255, 1),
                  Color.fromRGBO(255, 30, 209, 1)
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.repeated,
              )),
              height: size.height,
              width: size.width,
            );
}