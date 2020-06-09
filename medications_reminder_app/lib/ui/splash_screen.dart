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
  void initState() {
    super.initState();

    Timer(
        Duration(seconds: 3),
            () => Navigator.pushReplacementNamed(context, '/home'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
        ],
          ),


        ],
    ),
    );
  }
}
