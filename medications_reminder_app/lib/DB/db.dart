import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class DB extends ChangeNotifier {
  static const String _boxName = "scheduleBox";

  List<Schedule> _schedule = [];

  void initializeDB() async {
    final docsDirectory = await path_provider.getApplicationDocumentsDirectory();
    Hive.init(docsDirectory.path);
    getSchedules();
  }

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

    notifyListeners();
  }

  int get scheduleLength {
    return _schedule.length;
  }
}
