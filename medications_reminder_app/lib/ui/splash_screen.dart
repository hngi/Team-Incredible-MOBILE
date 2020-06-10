import 'dart:async';

import 'package:flutter/material.dart';
//import 'package:medications_reminder_app/ui/home_screen.dart';

import '../Notifications/notification_manager.dart';
import 'home_screen.dart';

//Note that the colors are #40b26d(main colour) and sub colour #fdfcff
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
void main() => runApp(MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.green, accentColor: Colors.yellowAccent),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  //SplashScreen({this.manager});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          decoration: BoxDecoration(color: Colors.green[900]),
        ),
        Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 50.0,
                  child: Icon(
                    Icons.local_pharmacy,
                    color: Colors.green[900],
                    size: 50.0,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0),
                ),
                Text(
                  "MediBuzz",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ])
      ]),
    );
  }
}
