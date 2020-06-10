import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/app_theme/app_theme.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';

import '../app_theme/app_theme.dart';

//Note that the colours are #fdfcff and #40b26d for button
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class DrugsDescriptionScreen extends StatelessWidget {
  final Schedule schedule;
  DrugsDescriptionScreen({this.schedule});
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: DrugsDescription(schedule: schedule));
  }
}

class DrugsDescription extends StatefulWidget {
  final Schedule schedule;
  DrugsDescription({this.schedule});
  @override
  _DrugsDescriptionState createState() => _DrugsDescriptionState();
}

class _DrugsDescriptionState extends State<DrugsDescription> {
  SizeConfig config = SizeConfig();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appThemeLight.primaryColorLight,
//      appBar: AppBar(
//        leading: IconButton(
//            icon: Icon(
//              Icons.keyboard_backspace,
//              color: appThemeLight.primaryColor,
//              size: config.xMargin(context, 8),
//            ),
//            tooltip: 'Info',
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        backgroundColor: appThemeLight.primaryColorLight,
//        elevation: 0.0,
//      ),
      body: Container(
        color: Theme.of(context).primaryColorLight,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  width: config.xMargin(context, 110),
                  height: config.yMargin(context, 13),
                  decoration: BoxDecoration(),
                  child: Padding(
                    padding: EdgeInsets.only(right: config.xMargin(context, 5)),
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: config.yMargin(context, 3),
                        ),
                        child: Column(
                          children: <Widget>[
                            Text(
                              widget.schedule.drugName,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appThemeLight.primaryColor,
                                fontSize: config.xMargin(context, 8),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.schedule.drugType,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: appThemeLight.primaryColor,
                                fontSize: config.xMargin(context, 4.5),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: config.yMargin(context, 5.0)),
            Container(
              width: config.xMargin(context, 90),
              height: config.yMargin(context, 50),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: config.yMargin(context, 50),
                decoration: BoxDecoration(
                    color: appThemeLight.primaryColorLight,
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(
                      config.xMargin(context, 6),
                    ),
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
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 9.8),
                      ),
                      child: Text(
                        'Dosage',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: config.xMargin(context, 4.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 2.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text(
                            '${widget.schedule.dosage}',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: config.xMargin(context, 5),
                            ),
                          ),
                          SizedBox(
                            width: config.xMargin(context, 2.5),
                          ),
                          TimeButton(
                            time: Text(
                              '9am',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: config.xMargin(context, 2.0),
                          ),
                          TimeButton(
                            time: Text(
                              '3pm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: config.xMargin(context, 2.0),
                          ),
                          TimeButton(
                            time: Text(
                              '9pm',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: config.yMargin(context, 3.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 4.0),
                      ),
                      child: Text(
                        'Program',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: config.xMargin(context, 4.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 2.0),
                      ),
                      child: Text(
                        'Total 8 weeks : 6 Weeks Left',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: config.xMargin(context, 5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 4.0),
                      ),
                      child: Text(
                        'Quantity',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: config.xMargin(context, 4.5),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: config.xMargin(context, 5.5),
                        top: config.xMargin(context, 2.0),
                      ),
                      child: Text(
                        'Total 169 Tablets : 104 Left',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: config.xMargin(context, 5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: config.yMargin(context, 5.0),
            ),
            Center(
                child: Container(
              height: config.yMargin(context, 6.5),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(
                  left: config.xMargin(context, 7.5),
                  right: config.xMargin(context, 7.5),
                ),
                child: FlatButton(
                  //Navigate to home screen after saving details in db
                  onPressed: () {
                    Navigator.pushNamed(context, '/addreminders');
                  },
                  child: Text(
                    'Change Schedule',
                    style: TextStyle(
                        color: Theme.of(context).primaryColorLight,
                        fontSize: config.xMargin(context, 5),
                        fontWeight: FontWeight.bold),
                  ),
                  color: Theme.of(context).buttonColor,
                  splashColor: Colors.greenAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      config.xMargin(context, 6.3),
                    ),
                  ),
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}

class TimeButton extends StatelessWidget {
  TimeButton({@required this.time});

  final Text time;

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: 15,
      height: 30,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: appThemeLight.buttonColor,
        onPressed: () {},
        child: time,
      ),
    );
  }
}
