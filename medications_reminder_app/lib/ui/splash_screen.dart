import 'package:flutter/material.dart';


//Note that the colors are #40b26d(main colour) and sub colour #fdfcff
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
          body: Center(
          child: Text('Splash Screen')
      ),
    );
  }
}