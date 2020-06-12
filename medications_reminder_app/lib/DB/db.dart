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

  bool isToday(){
    return this.startDate.difference(DateTime.now()) == 0;
  }

  int drugsLeft(Schedule schedule){
    int drugsLeft;
    int daysLeft = DB().diffFromPresent(schedule.endAt);
    if(daysLeft == DB().daysTotal(schedule.startAt, schedule.endAt)){
      drugsLeft = DB().totalQuantityOfDrugs(schedule);
    }else{
    drugsLeft = DB().totalQuantityOfDrugs(schedule) - DB().totalQuantityOfDrugs(schedule, overRide: daysLeft);}
    return drugsLeft;
  }

  int totalQuantityOfDrugs(Schedule schedule,{int overRide}){
    int numOfDays = DB().daysTotal(schedule.startAt, schedule.endAt) != 0 ? DB().daysTotal(schedule.startAt, schedule.endAt):
    1; 
    if(overRide != null){
      numOfDays = overRide;
    }
    int total;
    switch (schedule.frequency) {
      case 'Once':
        total= schedule.dosage *numOfDays;
        break;
      case 'Twice':
        total= 2 * schedule.dosage * numOfDays;
        break;
      case 'Thrice':
        total= 3 * schedule.dosage * numOfDays;
        break;
    }
     return total;
  }

  String getTimeline(DateTime start, DateTime end){
    return DB().daysTotal(start, end) <1 && diffFromPresent(end)==1 ? 'Total 1 day : ${diffFromPresent(end)} day Left' :
    DB().daysTotal(start, end) <1 && diffFromPresent(end) !=1 ? 'Total 1 day : ${diffFromPresent(end)} days Left' :
    'Total ${ DB().daysTotal(start, end)} days : ${diffFromPresent(end)} days Left' ;
  }

  int daysTotal(DateTime start, DateTime end){
    var difference =  end.difference(start);
    return difference.inDays;
  }
  int diffFromPresent(DateTime end){
    var difference =  DateTime.now().difference(end);
    return difference.inDays.abs();
  }

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
  this.secondTime = secondTime.length==0 ? null : DB().timeFromDB(secondTime);
  this.thirdTime = thirdTime.length==0 ? null : DB().timeFromDB(thirdTime);
  this.startDate = startDate;
  this.endDate = endDate;
  }

  void refresh(){
    this.drugName = '';
    this.selectedFreq = 'Once';
  this.selectedIndex = 0;
  this.dosage = 1;
  this.firstTime = TimeOfDay.now();
  this.secondTime = null;
  this.thirdTime = null;
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
    switch (freq) {
      case 'Twice':
      this.secondTime = TimeOfDay.now();
        this.thirdTime = null;
        break;
      case 'Once':
        this.secondTime = null;
        this.thirdTime = null;
        break;
      case 'Thrice':
        this.secondTime = TimeOfDay.now();
        this.thirdTime = TimeOfDay.now();
        break;
    }
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
    this.schedules = box.values.toList();
    notifyListeners();
  }

  Schedule getschedule(index) {
    return schedules[index];
  }

  void addSchedule(Schedule schedule) async {

    var box = Hive.box<Schedule>(_boxName);
    await box.add(schedule);

    this.schedules = box.values.toList();
    box.close();

    notifyListeners();
  }

  void deleteSchedule(key) {
    var box = Hive.box<Schedule>(_boxName);

    

    this.schedules = box.values.toList();
    box.deleteAt(key);
     box.close();

    notifyListeners();
      
  }

  void editSchedule({Schedule schedule}) {
     int scheduleKey = schedule.index;
    var box = Hive.box<Schedule>(_boxName);
     box.putAt(scheduleKey, schedule);

    this.schedules = box.values.toList();
     box.close();

    notifyListeners();
  }

  int get scheduleLength {
    return this.schedules.length;
  }
}