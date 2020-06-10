import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medications_reminder_app/model/schedule.dart';
// import 'package:path_provider/path_provider.dart' as path_provider;

class DB extends ChangeNotifier {
  static const String _boxName = "schedule";

  List<Schedule> _schedule = [];

  void getSchedules() async {
    Hive.registerAdapter(ScheduleAdapter());
    var box = await Hive.openBox<Schedule>(_boxName);

    _schedule = box.values.toList();

    notifyListeners();
  }

  Schedule getschedule(index) {
    return _schedule[index];
  }

  void addSchedule(Schedule schedule) async {
    Hive.registerAdapter(ScheduleAdapter());
    final schedule = Hive.box('schedule');
    schedule.add(schedule);

    notifyListeners();
  }

  void deleteSchedule(key) async {
    var box = await Hive.openBox<Schedule>(_boxName);

    await box.delete(key);
    Hive.box(_boxName).compact();

    _schedule = box.values.toList();

    notifyListeners();
  }

  void editSchedule({Schedule schedule, int scheduleKey}) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    await box.put(scheduleKey, schedule);

    _schedule = box.values.toList();

    notifyListeners();
  }

  int get scheduleLength {
    return _schedule.length;
  }
}