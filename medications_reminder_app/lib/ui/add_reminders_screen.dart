import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:medications_reminder_app/DB/db.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:medications_reminder_app/navigation/app_navigation/navigation.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';
import 'package:medications_reminder_app/ui/home_screen.dart';
import 'package:provider/provider.dart';
import '../notifications/notifications_manager.dart';

//Note that the colors are #2c7b4b(main colour) and sub colours #fdfcff and #40b26d for button
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
//I already added the google fonts package, use poppins
//I'M COUNTING ON YOU!!!
class RemindersScreen extends StatelessWidget {
  final String buttonText;
  final bool refresh;
  final Schedule schedule;
  RemindersScreen({this.refresh, this.buttonText, this.schedule});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Reminders(
            refresh: refresh, buttonText: buttonText, schedule: schedule));
  }
}

class Reminders extends StatefulWidget {
  final bool refresh;
  final String buttonText;
  Schedule schedule = Schedule();
  Reminders({this.refresh, this.buttonText, this.schedule});

  final NotificationManager notificationManager = NotificationManager();

  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
  @override
  void initState() {
    super.initState();
    widget.refresh
        ? Provider.of<DB>(context, listen: false).refresh()
        : Provider.of<DB>(context, listen: false).preload(
            widget.schedule.drugName,
            widget.schedule.frequency,
            widget.schedule.drugType,
            widget.schedule.dosage,
            widget.schedule.firstTime,
            widget.schedule.startAt,
            widget.schedule.endAt,
            secondTime: widget.schedule.secondTime == []
                ? []
                : widget.schedule.secondTime,
            thirdTime: widget.schedule.thirdTime == []
                ? []
                : widget.schedule.thirdTime);
  }

  //Instantiating a Navigation object to handle navigations
  Navigation navigation = Navigation();

//Instantiating a SizeConfig object to handle responsiveness
  SizeConfig config = SizeConfig();

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DB>(context);
    if (widget.buttonText == 'Update Schedule') {
      nameController.text = db.drugName ?? '';
    }

    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: IconButton(
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: Theme.of(context).primaryColor,
                    size: config.xMargin(context, 12),
                  ),
                  color: Theme.of(context).primaryColor,
                  //Navigate to previous screen
                  onPressed: () {
                    navigation.pushFrom(context, HomeScreen());
                  }),
            )),
        body: WillPopScope(
          onWillPop: () {
            navigation.pushFrom(context, HomeScreen());
            return Future.value(false);
          },
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: config.xMargin(context, 7.5)),
            child: Container(
              color: Theme.of(context).primaryColorLight,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView(
                children: <Widget>[
                  SizedBox(height: config.yMargin(context, 4)),
                  TextFormField(
                    controller: nameController,
                    cursorColor: Theme.of(context).primaryColorDark,
                    style: TextStyle(
                        color: Theme.of(context).primaryColorDark,
                        fontSize: config.xMargin(context, 5.5)),
                    decoration: InputDecoration(
                      hintText: 'Drug name',
                      hintStyle: TextStyle(
                          fontSize: config.xMargin(context, 5),
                          color: Theme.of(context).primaryColor),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorDark)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorDark)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorDark)),
                    ),
                  ),
                  SizedBox(height: config.yMargin(context, 4)),
                  Container(
                    height: config.yMargin(context, 8),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: db.drugTypes.length,
                      itemBuilder: (_, index) => Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () => db.updateSelectedIndex(index),
                            child: Container(
                              height: config.yMargin(context, 5),
                              width: config.xMargin(context, 20),
                              decoration: BoxDecoration(
                                  color: index == db.selectedIndex
                                      ? Theme.of(context).buttonColor
                                      : Theme.of(context).primaryColorLight,
                                  borderRadius: BorderRadius.circular(
                                      config.xMargin(context, 4))),
                              child: Center(
                                  child: Text(
                                db.drugTypes[index],
                                style: TextStyle(
                                    color: index == db.selectedIndex
                                        ? Theme.of(context).primaryColorLight
                                        : Theme.of(context)
                                            .primaryColorDark
                                            .withOpacity(.9),
                                    fontSize: config.xMargin(context, 4.5),
                                    fontWeight: FontWeight.w700),
                              )),
                            ),
                          ),
                          SizedBox(width: config.xMargin(context, 1.1))
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: config.yMargin(context, 3)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Reminder Frequency',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: config.xMargin(context, 5.5)),
                      ),
                      SizedBox(width: config.xMargin(context, 4.5)),
                      DropdownButton<String>(
                          underline: Text(''),
                          items: db.times.map((String time) {
                            return DropdownMenuItem<String>(
                                value: time, child: Text(time));
                          }).toList(),
                          value: db.selectedFreq,
                          onChanged: (newFreq) {
                            db.updateFrequency(newFreq);
                          })
                    ],
                  ),
                  SizedBox(height: config.yMargin(context, 2.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            'Dosage',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: config.xMargin(context, 5.5)),
                          ),
                          SizedBox(width: config.xMargin(context, 1)),
                          Text(
                            '(per day)',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: config.xMargin(context, 3.5)),
                          ),
                        ],
                      ),
                      SizedBox(width: config.xMargin(context, 1.5)),
                      Row(
                        children: <Widget>[
                          IconButton(
                              color: Theme.of(context).buttonColor,
                              icon: Icon(Icons.remove_circle),
                              onPressed: () => db.decrementDosage()),
                          Text('${db.dosage}'),
                          IconButton(
                              color: Theme.of(context).buttonColor,
                              icon: Icon(Icons.add_circle),
                              onPressed: () => db.incrementDosage()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: config.yMargin(context, 2.5)),
                  Text(
                    'Set time to receive notifications',
                    style: TextStyle(
                        fontSize: config.xMargin(context, 5.2),
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: config.yMargin(context, 4)),
                  db.selectedFreq == 'Once'
                      ? _once(localizations, db)
                      : db.selectedFreq == 'Twice'
                          ? _twice(localizations, db)
                          : _thrice(localizations, db),
                  SizedBox(height: config.yMargin(context, 3)),
                  Container(
                      height: config.yMargin(context, 50),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                              config.xMargin(context, 18))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Start',
                                style: TextStyle(
                                    fontSize: config.xMargin(context, 5)),
                              ),
                              SizedBox(width: config.xMargin(context, 3)),
                              FlatButton(
                                  onPressed: () => selectStartDate(context, db),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        localizations
                                            .formatShortMonthDay(db.startDate),
                                        style: TextStyle(
                                            fontSize:
                                                config.xMargin(context, 4.2)),
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(width: config.yMargin(context, 6)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'End',
                                style: TextStyle(
                                    fontSize: config.xMargin(context, 5)),
                              ),
                              SizedBox(width: config.xMargin(context, 3)),
                              FlatButton(
                                  onPressed: () => selectendDate(context, db),
                                  child: Row(
                                    children: <Widget>[
                                      Text(
                                        localizations
                                            .formatShortMonthDay(db.endDate),
                                        style: TextStyle(
                                            fontSize:
                                                config.xMargin(context, 4.2)),
                                      ),
                                      Icon(Icons.keyboard_arrow_down)
                                    ],
                                  ))
                            ],
                          ),
                          SizedBox(height: config.yMargin(context, 7)),
                          Center(
                              child: Container(
                            height: config.yMargin(context, 6.5),
                            width: MediaQuery.of(context).size.width,
                            child: FlatButton(
                              //Navigate to home screen after saving details in db
                              onPressed: () {
                                if (nameController.text.isNotEmpty) {
                                  switch (widget.buttonText) {
                                    case 'Add Schedule':
                                      db.addSchedule(Schedule(
                                        index: db.scheduleLength,
                                        drugName: nameController.text,
                                        drugType:
                                            db.drugTypes[db.selectedIndex],
                                        frequency: db.selectedFreq,
                                        startAt: db.startDate,
                                        dosage: db.dosage,
                                        endAt: db.endDate,
                                        firstTime: [
                                          db.firstTime.hour,
                                          db.firstTime.minute
                                        ],
                                        secondTime: db.secondTime != null
                                            ? [
                                                db.secondTime.hour,
                                                db.secondTime.minute
                                              ]
                                            : [],
                                        thirdTime: db.thirdTime != null
                                            ? [
                                                db.thirdTime.hour,
                                                db.thirdTime.minute
                                              ]
                                            : [],
                                      ));
                                      break;
                                    case 'Update Schedule':
                                      db.editSchedule(
                                          schedule: Schedule(
                                        index: widget.schedule.index,
                                        drugName: nameController.text,
                                        drugType:
                                            db.drugTypes[db.selectedIndex],
                                        frequency: db.selectedFreq,
                                        startAt: db.startDate,
                                        dosage: db.dosage,
                                        endAt: db.endDate,
                                        firstTime: [
                                          db.firstTime.hour,
                                          db.firstTime.minute
                                        ],
                                        secondTime: db.secondTime != null
                                            ? [
                                                db.secondTime.hour,
                                                db.secondTime.minute
                                              ]
                                            : [],
                                        thirdTime: db.thirdTime != null
                                            ? [
                                                db.thirdTime.hour,
                                                db.thirdTime.minute
                                              ]
                                            : [],
                                      ));

                                      break;
                                  }

                                  navigation.pushFrom(context, HomeScreen());
                                } else {
                                  customSnackbar(
                                    title: 'Message',
                                    message: 'Drug name not set',
                                    success: false,
                                    seconds: 3,
                                    // route: '/home' redirect user
                                  );

                                  //showSnackBar(context);
                                }
                              },
                              child: Text(
                                widget.buttonText,
                                style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                    fontSize: config.xMargin(context, 5),
                                    fontWeight: FontWeight.bold),
                              ),
                              color: Theme.of(context).buttonColor,
                              splashColor: Colors.greenAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      config.xMargin(context, 6.3))),
                            ),
                          ))
                        ],
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  _once(MaterialLocalizations localizations, DB db) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectFirstTime(context, db),
          child: Text(
            localizations.formatTimeOfDay(db.firstTime),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
      ],
    );
  }

  _thrice(MaterialLocalizations localizations, DB db) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectFirstTime(context, db),
          child: Text(
            localizations.formatTimeOfDay(db.firstTime),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
        SizedBox(width: config.xMargin(context, 5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectSecondTime(context, db),
          child: Text(
            db.secondTime != null
                ? localizations.formatTimeOfDay(db.secondTime)
                : localizations.formatTimeOfDay(TimeOfDay.now()),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
        SizedBox(width: config.xMargin(context, 5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectThirdTime(context, db),
          child: Text(
            db.thirdTime != null
                ? localizations.formatTimeOfDay(db.thirdTime)
                : localizations.formatTimeOfDay(TimeOfDay.now()),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
      ],
    );
  }

  _twice(MaterialLocalizations localizations, DB db) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectFirstTime(context, db),
          child: Text(
            localizations.formatTimeOfDay(db.firstTime),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
        SizedBox(width: config.xMargin(context, 5.5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectSecondTime(context, db),
          child: Text(
            db.secondTime != null
                ? localizations.formatTimeOfDay(db.secondTime)
                : localizations.formatTimeOfDay(TimeOfDay.now()),
            style: TextStyle(fontSize: config.xMargin(context, 4.2)),
          ),
        ),
      ],
    );
  }

  Future<Null> selectFirstTime(BuildContext context, DB db) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: db.firstTime,
    );
    if (selectedTime != null && selectedTime != db.firstTime) {
      db.updateFirstTime(selectedTime);
    }
  }

  Future<Null> selectSecondTime(BuildContext context, DB db) async {
    TimeOfDay initialTime = db.secondTime ?? TimeOfDay.now();
    print(initialTime);
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime != null && selectedTime != db.secondTime) {
      db.updateSecondTime(selectedTime);
    }
  }

  Future<Null> selectThirdTime(BuildContext context, DB db) async {
    TimeOfDay initialTime = db.thirdTime ?? TimeOfDay.now();
    print(initialTime);
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: initialTime,
    );
    if (selectedTime != null && selectedTime != db.thirdTime) {
      db.updateThirdTime(selectedTime);
    }
  }

  Future<Null> selectStartDate(BuildContext context, DB db) async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: db.startDate,
        firstDate: DateTime(db.startDate.year),
        lastDate: DateTime(db.startDate.year + 1));
    if (selectedDate != null && selectedDate != db.startDate) {
      db.updateStartDate(selectedDate);
    }
  }

  Future<Null> selectendDate(BuildContext context, DB db) async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: db.endDate,
        firstDate: DateTime(db.endDate.year),
        lastDate: DateTime(db.endDate.year + 1));
    if (selectedDate != null && selectedDate != db.endDate) {
      db.updateEndDate(selectedDate);
    }
  }

  void showSnackBar(BuildContext context) {
    SnackBar snackBar = SnackBar(
      backgroundColor: Colors.grey[200],
      duration: Duration(seconds: 2),
      content: Text(
        'Drug name not set',
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: config.textSize(context, 5.3),
            color: Theme.of(context).primaryColorDark),
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }

  void scheduleNotifications(
      TimeOfDay time, NotificationManager manager, DB db) {
    if (DateTime.now().day <= db.startDate.day &&
        db.endDate.compareTo(DateTime.now()) >= 0) {
      manager.showNotificationDaily(
          9, 'Paracetamol', '3 times', time.hour, time.minute);
    } else if (DateTime.now().day >= db.startDate.day &&
        db.endDate.compareTo(DateTime.now()) >= 0) {
      manager.showNotificationDaily(
          9,
          db.drugName,
          db.dosage > 1
              ? db.dosage.toString() + ' pills'
              : db.dosage.toString() + ' pill',
          time.hour,
          time.minute);
    }
  }

  customSnackbar(
      {String title,
      String message,
      bool success = true,
      int seconds = 2,
      String route}) {
    return Flushbar(
      title: title,
      message: message,
      flushbarPosition:
          success ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
            color: success ? Colors.green[800] : Colors.red[300],
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0)
      ],
      backgroundGradient: LinearGradient(colors: [
        success ? Theme.of(context).primaryColor : Colors.red[300],
        success ? Theme.of(context).primaryColor : Colors.red[300]
      ]),
      isDismissible: true,
      duration: Duration(seconds: seconds),
      icon: Icon(
        success ? Icons.check : Icons.close,
        color: success ? Colors.greenAccent : Colors.red,
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor:
          success ? Colors.greenAccent : Colors.red[400],
      titleText: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Theme.of(context).primaryColorLight,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontSize: 18.0,
            color: Theme.of(context).primaryColorLight,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    )..show(context).then((value) {
        if (route != '') {
          Navigator.pushNamed(context, route);
        }
      });
  }
}
