import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/cupertino.dart';


//Note that the colors are #40b26d(main colour) and sub colour #fdfcff
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green[900],
        body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[

        Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Container(
        alignment: Alignment.center,
        child:
        Center(
        child: Image.asset('assets/YouDose.png', width: MediaQuery.of(context).size.width*.9,),
    )

    ),

    Container(
    width: 200.0,
    height: 60.0,
    margin: EdgeInsets.fromLTRB(0, 180.0, 0, 0.0),
    decoration: BoxDecoration(
    color: Colors.green[600],
    shape: BoxShape.rectangle,
    borderRadius: BorderRadius.all(
    Radius.circular(10.0),
    ),
    ),



    child: FlatButton(
    child: Text('Get Started' ,
    style: TextStyle(
    fontSize: 18.0,
    color: Colors.white,
    fontWeight: FontWeight.normal,
    ),
    ),
    onPressed: (){
    Navigator.pushNamed(context, '/home');
    },
    ),
    ),
    ],
    ),

        ],
        ),
    );
  }

}