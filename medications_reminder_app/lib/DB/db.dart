import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:medications_reminder_app/model/schedule_model.dart';

class DB extends ChangeNotifier {
  static const String _boxName = "scheduleBox";

  final List drugTypes = ['Tablet', 'Capsule', 'Drop', 'Injection'];
  final List<String> times = ['Once', 'Twice', 'Thrice'];
  var selectedFreq = 'Once';
  int selectedIndex = 0;
  int dosage = 1;
  TimeOfDay firstTime = TimeOfDay.now();
  TimeOfDay secondTime = TimeOfDay.now();
  TimeOfDay thirdTime = TimeOfDay.now();
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  String drugName;

  List<Schedule> schedules = [];

  TimeOfDay timeFromDB(List<int> time){
    return TimeOfDay(hour: time[0], minute: time[1]);
  }

  void preload(String drugName, String freq, String drugType, int dosage, List<int> firstTime, DateTime startDate, DateTime endDate, {List<int> thirdTime, List<int> secondTime,}){
     this.drugName = drugName;
     this.selectedFreq = freq;
  this.selectedIndex = drugType == 'Tablet' ? 0 : drugType == 'Capsule' ? 1 : 
  drugType == 'Drop' ? 2 : 3;
  this.dosage = dosage;
  this.firstTime = DB().timeFromDB(firstTime);
  this.secondTime = secondTime == [] ? null : DB().timeFromDB(secondTime);
  this.thirdTime = thirdTime == [] ? null : DB().timeFromDB(thirdTime);
  this.startDate = startDate;
  this.endDate = endDate;
  }

  void refresh(){
    this.drugName = '';
    this.selectedFreq = 'Once';
  this.selectedIndex = 0;
  this.dosage = 1;
  this.firstTime = TimeOfDay.now();
  this.secondTime = TimeOfDay.now();
  this.thirdTime = TimeOfDay.now();
  this.startDate = DateTime.now();
  this.endDate = DateTime.now();
  }

  void updateStartDate(DateTime newDate){
    this.startDate = newDate;
    notifyListeners();
  }
  void updateEndDate(DateTime newDate){
    this.endDate = newDate;
    notifyListeners();
  }

  void updateFirstTime(TimeOfDay selected){
    this.firstTime = selected;
    notifyListeners();
  }
  void updateSecondTime(TimeOfDay selected){
    this.secondTime= selected;
    notifyListeners();
  }
  void updateThirdTime(TimeOfDay selected){
    this.thirdTime = selected;
    notifyListeners();
  }

  void updateFrequency(String freq) {
    this.selectedFreq = freq;
    notifyListeners();
  }

  void incrementDosage() {
    this.dosage++;
    notifyListeners();
  }

  void decrementDosage() {
    if (this.dosage > 1) {
      this.dosage--;
      notifyListeners();
    }
  }

  void updateSelectedIndex(int index) {
    this.selectedIndex = index;
    notifyListeners();
  }

  void getSchedules() async {
    var box = await Hive.openBox<Schedule>(_boxName);
    this.schedules = box.values.toList().reversed.toList();
    notifyListeners();
  }

  Schedule getschedule(index) {
    return schedules[index];
  }

  void addSchedule(Schedule schedule) async {
    var box = await Hive.openBox<Schedule>(_boxName);
    await box.add(schedule);

    this.schedules = box.values.toList();

    notifyListeners();
  }

  void deleteSchedule(key) async {
    var box = await Hive.openBox<Schedule>(_boxName);

    await box.deleteAt(key);
    Hive.box(_boxName).compact();

    this.schedules = box.values.toList();

    notifyListeners();
      
  }

  void editSchedule({Schedule schedule}) async {
     int scheduleKey = schedule.index;
    var box = Hive.box<Schedule>(_boxName);
    await box.putAt(scheduleKey, schedule);

    this.schedules = box.values.toList();

    notifyListeners();
  }

  int get scheduleLength {
    return this.schedules.length;
  }
}
