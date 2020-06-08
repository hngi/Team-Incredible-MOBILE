import 'package:flutter/material.dart';


//Note that the colours are #fdfcff and #40b26d for button
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class DrugsDescriptionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DrugsDescription());
  }
}

class DrugsDescription extends StatefulWidget {
  @override
  _DrugsDescriptionState createState() => _DrugsDescriptionState();
}

class _DrugsDescriptionState extends State<DrugsDescription> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Drugs Description Screen'),
    );
  }
}