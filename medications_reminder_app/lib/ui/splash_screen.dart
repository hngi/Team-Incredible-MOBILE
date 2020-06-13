import 'dart:async';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/navigation/page_transitions/animations.dart';
import 'package:medications_reminder_app/ui/home_screen.dart';
import 'package:medications_reminder_app/ui/onboarding.dart';


//Note that the colors are #40b26d(main colour) and sub colour #fdfcff
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void open() async{
    await Hive.openBox('onboarding');
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1800),() {
       box.get('status') == 'true' ? Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=> HomeScreen())) :
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Onboarding()));
    });
  }

  var box = Hive.box('onboarding');

  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).primaryColor,
        child: ImageAnimation(child:Center(
          child: Image(
                image: AssetImage('images/medbuzz.png')
              ),
        ),
      ))
    );

  }
}