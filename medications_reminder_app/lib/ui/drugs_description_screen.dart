import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/app_theme/app_theme.dart';

import '../app_theme/app_theme.dart';

//Note that the colours are #fdfcff and #40b26d for button
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
    return Scaffold(
      backgroundColor: appThemeLight.primaryColorLight,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50, left: 35),
            //Button to take the user back to the home screen
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 50,
                color: Colors.black38,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 10),
            child: Row(
              children: <Widget>[
                //This image section should be based on whatever kind of drug the user selects upon creation of schedule.
                Image.asset(
                  'images/tablet.png',
                  height: 110,
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[

                    Text(
                      'Drug name',
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    //The drug name and further details below should be in line with the users inputs upon schedule creation
                    Text(
                      'Aspirin',
                      style: TextStyle(
                          fontSize: 20,
                          color: appThemeLight.buttonColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Dosage',
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    Text(
                      '300 mg',
                      style: TextStyle(
                          fontSize: 20,
                          color: appThemeLight.buttonColor,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Time',
                      style: TextStyle(color: Color(0xff808080)),
                    ),
                    Text(
                      '3 pm',
                      style: TextStyle(
                          fontSize: 20,
                          color: appThemeLight.buttonColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            margin: EdgeInsets.only(top: 50, left: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                //Carefully look through the design chosen to understand what should happen here
                Text(
                  'Dose',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      '3 times',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '3pm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3pm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      '3pm',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Program',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Total: ' + '8' + ' weeks',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                  width: 20,
                ),
                    Text(
                      '6' + ' weeks' + ' left',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xff000000),
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      'Total: ' + '150' + ' capsules',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                    SizedBox(
                  width: 20,
                ),
                    Text(
                      '120' + ' capsules' + ' left',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff808080),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          //This button should navigate the user to a screen exactly like the add reminders screen. But in this case, the various fields should be filled with details found in this screen.
          Center(
            child: ButtonTheme(
              minWidth: 350,
              height: 60,
              child: RaisedButton(
                elevation: 0.0,
                onPressed: () {},
                color: appThemeLight.buttonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Change Schedule',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                textColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
