import 'dart:developer';



import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../model/schedule_model.dart';


class dataHolder extends ChangeNotifier {
  static const String _boxName = "scheduleBox";

  List<Schedule> _schedule = [];
  Schedule _activeSchedule;



  void getSchedules() async {
    var box = await Hive.openBox<Schedule>(_boxName);
    _schedule = box.values.toList();
    notifyListeners();
  }

  Schedule getschedule(index) {
    return _schedule[index];
  }

  void addSchedule(Schedule schedule) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    await box.add(schedule);
    _schedule = box.values.toList();
    var len = _schedule.length;
    log(_schedule[2].name);
    log("saved");
    log("saved lenght $len");
    notifyListeners();
  }

  void deleteSchedule(key) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    await box.add(key);

    _schedule = box.values.toList();

    notifyListeners();
  }

  void editSchedule({Schedule schedule, int scheduleKey}) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    await box.put(scheduleKey, schedule);

    _schedule = box.values.toList();

    _activeSchedule = box.get(scheduleKey);

    notifyListeners();
  }

  int get scheduleLength {
    return _schedule.length;
  }

  void setActiveSchedule(key) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    _activeSchedule = box.get(key);
    notifyListeners();
  }

  Schedule getActiveSchedule(){
    return _activeSchedule;
  }
}
