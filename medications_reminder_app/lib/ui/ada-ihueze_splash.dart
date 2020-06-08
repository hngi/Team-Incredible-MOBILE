import 'dart:async';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp( 
  theme: 
  ThemeData(primaryColor: Colors.green, accentColor: Colors.yellowAccent),
  debugShowCheckedModeBanner: false,
  home: SplashScreen(),
 ));

class SplashScreen extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),() => print("Done"));
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.green[900]),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
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
                          "MediRemind",
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold),
                          )
                    ],
                  ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        Padding(
                          padding: EdgeInsets.only(top: 20.0),
                          ),
                          Text("Reminder You \n Can Trust", style: TextStyle(color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.bold),
                          )
                      ]
                    ),
                    )
              ]
            )
        ]
      ),
    );
  }
}
