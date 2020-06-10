import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'schedule.g.dart';

@HiveType(typeId: 0)
class Schedule {
  @HiveField(0)
  String name;

  @HiveField(1)
  String drugType;

  @HiveField(2)
  String frequency;

  @HiveField(3)
  int dosage;

  @HiveField(4)
  TimeOfDay firstTime;

  @HiveField(5)
  TimeOfDay secondTime;

  @HiveField(6)
  TimeOfDay thirdTime;

  @HiveField(7)
  DateTime startDate;

  @HiveField(8)
  DateTime endDate;

  Schedule({this.name, this.frequency, this.drugType, this.dosage, this.endDate, this.firstTime, this.secondTime, this.startDate, this.thirdTime});
}