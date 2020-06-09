import 'package:flutter/material.dart';
import 'package:medications_reminder_app/responsiveness/size_config.dart';

//Note that the colors are #2c7b4b(main colour) and sub colours #fdfcff and #40b26d for button
//! Colours have now been included in the app_theme.dart file so you can use Theme.of(context).whatever_color you like
class Reminders extends StatefulWidget {
  @override
  _RemindersState createState() => _RemindersState();
}

class _RemindersState extends State<Reminders> {
//Instantiating a SizeConfig object to handle responsiveness
  SizeConfig config = SizeConfig();

  final List drugTypes = ['Tablet', 'Capsule', 'Drops', 'Injection'];
  final List<String> times = ['Once', 'Twice', 'Thrice'];
  var _selectedTime = 'Once';
  int selectedIndex = 0;
  int _dosage = 1;
  TimeOfDay _currentTime = TimeOfDay.now();
  TimeOfDay _currentTime2 = TimeOfDay.now();
  TimeOfDay _currentTime3 = TimeOfDay.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColorLight,
        appBar: AppBar(
            backgroundColor: Theme.of(context).primaryColorLight,
            elevation: 0,
            leading: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 18),
              child: IconButton(
                  icon: Icon(Icons.arrow_back, size: 35,),
                  color: Theme.of(context).primaryColor,
                  //Navigate to previous screen
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            )),
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: config.xMargin(context, 9), vertical: config.yMargin(context, 2.5)),
          child: Container(
            color: Theme.of(context).primaryColorLight,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  cursorColor: Theme.of(context).primaryColorDark,
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: config.xMargin(context, 5.5)),
                  decoration: InputDecoration(
                    hintText: 'Drug name',
                    hintStyle: TextStyle(
                        fontSize: config.xMargin(context, 5),
                        color: Color(0xff808080),
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
                SizedBox(height: config.yMargin(context, 5)),
                Container(
                  height: config.yMargin(context, 8),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: drugTypes.length,
                    itemBuilder: (_, index) => Row(
                      children: <Widget>[
                        InkWell(
                          onTap: () => setState(() {
                            selectedIndex = index;
                          }),
                          child: Container(
                            height: config.yMargin(context, 5),
                            width: config.xMargin(context, 20),
                            decoration: BoxDecoration(
                                color: index == selectedIndex
                                    ? Theme.of(context).buttonColor
                                    : Theme.of(context).primaryColorLight,
                                borderRadius: BorderRadius.circular(
                                    config.xMargin(context, 4))),
                            child: Center(
                                child: Text(
                              drugTypes[index],
                              style: TextStyle(
                                  color: index == selectedIndex
                                      ? Theme.of(context).primaryColorLight
                                      : Theme.of(context).primaryColorDark,
                                  fontSize: config.xMargin(context, 4),
                                  fontWeight: FontWeight.w700),
                            )),
                          ),
                        ),
                        SizedBox(width: config.xMargin(context, 1.1))
                      ],
                    ),
                  ),
                ),
                SizedBox(height: config.yMargin(context, 4.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Reminder Frequency',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    SizedBox(width: config.xMargin(context, 4.5)),
                    DropdownButton<String>(
                        underline: Text(''),
                        items: times.map((String time) {
                          return DropdownMenuItem<String>(
                              value: time, child: Text(time));
                        }).toList(),
                        value: _selectedTime,
                        onChanged: (newTime) {
                          setState(() {
                            _selectedTime = newTime;
                          });
                        })
                  ],
                ),
                SizedBox(height: config.yMargin(context, 2.5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Dosage (per day)',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: config.xMargin(context, 5.5)),
                    ),
                    SizedBox(width: config.xMargin(context, 1.5)),
                    Row(
                      children: <Widget>[
                        IconButton(
                            color: Theme.of(context).buttonColor,
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              setState(() {
                                if (_dosage > 1) {
                                  _dosage--;
                                }
                              });
                            }),
                        Text('$_dosage'),
                        IconButton(
                            color: Theme.of(context).buttonColor,
                            icon: Icon(Icons.add_circle),
                            onPressed: () {
                              setState(() {
                                _dosage++;
                              });
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: config.yMargin(context, 2.5)),
                Text(
                  'Set time to receive notifications',
                  style: TextStyle(
                      fontSize: config.xMargin(context, 5.5),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: config.yMargin(context, 4)),
                _selectedTime == 'Once'
                    ? _once(localizations)
                    : _selectedTime == 'Twice'
                        ? _twice(localizations)
                        : _thrice(localizations),
                SizedBox(height: config.yMargin(context, 4)),
                Container(
                    height: config.yMargin(context, 50),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(config.xMargin(context, 18))),
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
                                onPressed: () => selectStartDate(context),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${localizations.formatShortMonthDay(startDate)}',
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
                                onPressed: () => selectendDate(context),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      '${localizations.formatShortMonthDay(endDate)}',
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
                          height: config.yMargin(context, 7),
                          width: MediaQuery.of(context).size.width,
                          child: FlatButton(
                            //Navigate to home screen after saving details in db
                            onPressed: () {},
                            child: Text(
                              'Add Schedule',
                              style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
                                  fontSize: config.xMargin(context, 5),
                                  fontWeight: FontWeight.bold),
                            ),
                            color: Theme.of(context).buttonColor,
                            splashColor: Colors.greenAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    config.xMargin(context, 3.5))),
                          ),
                        ))
                      ],
                    )),
              ],
            ),
          ),
        ));
  }

  _once(MaterialLocalizations localizations) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime(context),
          child: Text(localizations.formatTimeOfDay(_currentTime)),
        ),
      ],
    );
  }

  _thrice(MaterialLocalizations localizations) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime(context),
          child: Text(localizations.formatTimeOfDay(_currentTime)),
        ),
        SizedBox(width: config.xMargin(context, 5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime2(context),
          child: Text(localizations.formatTimeOfDay(_currentTime2)),
        ),
        SizedBox(width: config.xMargin(context, 5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime3(context),
          child: Text(localizations.formatTimeOfDay(_currentTime3)),
        ),
      ],
    );
  }

  _twice(MaterialLocalizations localizations) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime(context),
          child: Text(localizations.formatTimeOfDay(_currentTime)),
        ),
        SizedBox(width: config.xMargin(context, 5)),
        Icon(
          Icons.access_time,
        ),
        SizedBox(width: config.xMargin(context, 1.5)),
        InkWell(
          focusColor: Theme.of(context).primaryColorLight,
          splashColor: Colors.greenAccent,
          onTap: () => selectTime2(context),
          child: Text(localizations.formatTimeOfDay(_currentTime2)),
        ),
      ],
    );
  }

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime,
    );
    if (selectedTime != null && selectedTime != _currentTime) {
      setState(() {
        _currentTime = selectedTime;
      });
    }
  }

  Future<Null> selectTime2(BuildContext context) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime2,
    );
    if (selectedTime != null && selectedTime != _currentTime2) {
      setState(() {
        _currentTime2 = selectedTime;
      });
    }
  }

  Future<Null> selectTime3(BuildContext context) async {
    final TimeOfDay selectedTime = await showTimePicker(
      context: context,
      initialTime: _currentTime3,
    );
    if (selectedTime != null && selectedTime != _currentTime3) {
      setState(() {
        _currentTime3 = selectedTime;
      });
    }
  }

  Future<Null> selectStartDate(BuildContext context) async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: startDate,
        firstDate: DateTime(startDate.year),
        lastDate: DateTime(startDate.year + 5));
    if (selectedDate != null && selectedDate != startDate) {
      setState(() {
        startDate = selectedDate;
        print(startDate);
      });
    }
  }

  Future<Null> selectendDate(BuildContext context) async {
    final DateTime selectedDate = await showDatePicker(
        context: context,
        initialDate: endDate,
        firstDate: DateTime(endDate.year),
        lastDate: DateTime(endDate.year + 5));
    if (selectedDate != null && selectedDate != endDate) {
      setState(() {
        endDate = selectedDate;
        print(endDate);
      });
    }
  }
}
