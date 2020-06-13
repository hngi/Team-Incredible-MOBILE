import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/navigation/app_navigation/navigation.dart';
import 'package:medications_reminder_app/notifications/notifications_manager.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:medications_reminder_app/ui/add_reminders_screen.dart';
import 'package:medications_reminder_app/ui/home_screen.dart';
import 'package:medications_reminder_app/ui/scroll_configuration.dart';

//Note that the colours are #fdfcff and #40b26d for button
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class DrugsDescriptionScreen extends StatelessWidget {
  final Schedule schedule;
  final String payload;
  DrugsDescriptionScreen({this.schedule, this.payload});
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
  Navigation navigation = Navigation();
  DB db = DB();
  final NotificationManager notificationManager = NotificationManager();
  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: Theme.of(context).primaryColorLight,
              size: config.xMargin(context, 8),
            ),
            tooltip: 'Go to home screen',
            onPressed: () {
              navigation.pushFrom(context, HomeScreen());
            }),
        elevation: 0.0,
      ),
      body: WillPopScope(
        onWillPop: () {
          navigation.pushFrom(context, HomeScreen());
          return Future.value(false);
        },
        child: Container(
          margin: EdgeInsets.only(top: height * .06),
          width: width,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColorLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(config.xMargin(context, 7)),
                topRight: Radius.circular(config.xMargin(context, 7)),
              )),
          child: Container(
            color: Theme.of(context).primaryColorLight,
            margin: EdgeInsets.only(
                top: height * .04,
                left: config.xMargin(context, 7),
                right: config.xMargin(context, 7)),
            height: height,
            width: width,
            child: ScrollConfiguration(
              behavior: CustomScrollBehavior(),
              child: ListView(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          IconButton(
                            color: Colors.redAccent,
                            disabledColor: Colors.redAccent,
                            iconSize: config.xMargin(context, 9),
                            onPressed: () async {
                              showSnackBar(context);
                              Future.delayed(Duration(milliseconds: 500))
                                  .then((value) {
                                    notificationManager.removeReminder(
                                              widget.schedule.id);
                                db.deleteSchedule(widget.schedule.index);
                                navigation.pushFrom(context, HomeScreen());
                              });
                            },
                            icon: Icon(
                              Icons.delete,
                            ),
                          ),
                        ],
                      ),
                      Container(
                          width: width,
                          alignment: Alignment.center,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                widget.schedule.drugType == 'Tablet'
                                    ? shape('images/icons8-tablets-32.png')
                                    : widget.schedule.drugType == 'Capsule'
                                        ? shape('images/icons8-pill-32.png')
                                        : widget.schedule.drugType == 'Drop'
                                            ? shape('images/drop.png')
                                            : widget.schedule.drugType ==
                                                    'Injection'
                                                ? shape(
                                                    'images/icons8-syringe-32.png')
                                                : Container(),
                                //SizedBox(width:config.xMargin(context, 10)),

                                Expanded(
                                  child: Text(
                                    widget.schedule.drugName,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: config.xMargin(context, 8.5),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                  SizedBox(height: config.yMargin(context, 6)),
                  Container(
                    width: width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'Dosage',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: config.textSize(context, 7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: config.yMargin(context, 2)),
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex:2,
                              child: Text(
                                db.scheduleDescription(widget.schedule),
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: config.xMargin(context, 5),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: config.xMargin(context, 4.5),
                            ),
                            widget.schedule.firstTime.length != 0
                                ? Text(
                                    localizations.formatTimeOfDay(db
                                        .timeFromDB(widget.schedule.firstTime)),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: config.xMargin(context, 3.8)),
                                  )
                                : Container(),
                            SizedBox(
                              width: config.xMargin(context, 2.0),
                            ),
                            widget.schedule.secondTime.length != 0
                                ? Text(
                                    localizations.formatTimeOfDay(db.timeFromDB(
                                        widget.schedule.secondTime)),
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: config.xMargin(context, 3.8)),
                                  )
                                : Container(),
                            SizedBox(
                              width: config.xMargin(context, 2.0),
                            ),
                            widget.schedule.thirdTime.length != 0
                                ? Text(
                                      localizations.formatTimeOfDay(
                                          db.timeFromDB(
                                              widget.schedule.thirdTime)),
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: config.xMargin(context, 3.8)),
                                    )
                                : Container(),
                            SizedBox(
                              width: config.xMargin(context, 2.0),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: config.yMargin(context, 3.0),
                        ),
                        Text(
                          'Program',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: config.textSize(context, 7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: config.yMargin(context, 2),
                        ),
                        Text(
                          db.getTimeline(
                              widget.schedule.startAt, widget.schedule.endAt),
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: config.xMargin(context, 5),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          'Quantity',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: config.textSize(context, 7),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: config.yMargin(context, 2)),
                        Text(
                          db.totalQuantityOfDrugs(widget.schedule) == 1
                              ? 'Total ${db.totalQuantityOfDrugs(widget.schedule)} ${widget.schedule.drugType.toLowerCase()} : ${db.drugsLeft(widget.schedule)} Left'
                              : 'Total ${db.totalQuantityOfDrugs(widget.schedule)} ${widget.schedule.drugType.toLowerCase()}s : ${db.drugsLeft(widget.schedule)} Left',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontSize: config.xMargin(context, 5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: config.yMargin(context, 8),
                  ),
                  Center(
                      child: Container(
                        margin: EdgeInsets.only(bottom: config.yMargin(context, 4)),
                    height: config.yMargin(context, 6.5),
                    width: MediaQuery.of(context).size.width,
                    child: FlatButton(
                      //Navigate to home screen after saving details in db
                      onPressed: () {
                        navigation.pushToAndReplace(
                            context,
                            RemindersScreen(
                              buttonText: 'Update Schedule',
                              refresh: false,
                              schedule: widget.schedule,
                            ));
                      },
                      child: Text(
                        'Change Schedule',
                        style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontSize: config.textSize(context, 6),
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
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Theme.of(context).buttonColor.withOpacity(.9),
      duration: Duration(seconds: 2),
      content: Text(
        'Schedule deleted',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: config.textSize(context, 5.3),
            color: Theme.of(context).primaryColorLight),
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  shape(String path) {
    return Image(
      height: config.yMargin(context, 12),
      width: config.xMargin(context, 34),
      image: AssetImage(path),
      color: Theme.of(context).primaryColor,
    );
  }
}
