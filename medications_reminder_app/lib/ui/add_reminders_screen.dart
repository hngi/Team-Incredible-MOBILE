import 'package:flutter/material.dart';

//Note that the colors are #2c7b4b(main colour) and sub colours #fdfcff and #40b26d for button
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class RemindersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Reminders());
  }
}

class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Reminders Screen'),
    );
  }
}
