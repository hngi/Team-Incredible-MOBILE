import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/app_theme/app_theme.dart';

import '../app_theme/app_theme.dart';
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.info), tooltip: 'Back', onPressed: () {}),
          ],
          leading: IconButton(
              icon: Icon(Icons.keyboard_backspace),
              tooltip: 'Info',
              onPressed: () {}),
          backgroundColor: appThemeLight.primaryColor,
          elevation: 0.0,
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 200.0,
            decoration: BoxDecoration(
              color: appThemeLight.primaryColor,
              image: DecorationImage(
                image: AssetImage('images/pill.png'),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 400,
            height: 400,
            child: Container(
              height: 100.0,
              width: 100.0,
              decoration: BoxDecoration(
                  color: appThemeLight.primaryColorLight,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFFEDEFF2),
                      blurRadius: 25.0,
                      spreadRadius: 2.0,
                    ),
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 0.0, 0.0),
                    child: Text(
                      'Dosage',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25, 15, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          '3 Times:',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ButtonTheme(
                          minWidth: 15,
                          height: 30,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: appThemeLight.buttonColor,
                            onPressed: () {},
                            child: Text(
                              '9am',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonTheme(
                          minWidth: 15,
                          height: 30,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: appThemeLight.buttonColor,
                            onPressed: () {},
                            child: Text(
                              '3pm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        ButtonTheme(
                          minWidth: 15,
                          height: 30,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            color: appThemeLight.buttonColor,
                            onPressed: () {},
                            child: Text(
                              '3pm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 0.0, 0.0),
                    child: Text(
                      'Program',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'Total 8 weeks : 6 Weeks Left',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 25.0, 0.0, 0.0),
                    child: Text(
                      'Quantity',
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(25.0, 15.0, 0.0, 0.0),
                    child: Text(
                      'Total 169 Tablets : 104 Left',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          ButtonTheme(
            minWidth: 270,
            height: 50,
            child: RaisedButton(
              elevation: 0.0,
              onPressed: () {},
              color: appThemeLight.buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(80.0),
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
        ],
      ),
    );
  }
}
