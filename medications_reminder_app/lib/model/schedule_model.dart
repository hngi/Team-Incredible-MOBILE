import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId:0)
class Schedule {
  @HiveField(0)
  String drugName;

  @HiveField(1)
  String drugType;

  @HiveField(2)
  int dosage;

  @HiveField(3)
  String frequency;

  @HiveField(4)
  DateTime startAt;

  @HiveField(5)
  TimeOfDay firstTime;

  @HiveField(6)
  DateTime endAt;

  @HiveField(7)
  @HiveType(typeId:15)
  TimeOfDay secondTime;

  @HiveField(8)
  @HiveType(typeId:15)
  TimeOfDay thirdTime;
  
  Schedule({
  this.drugName,
    this.drugType,
    this.dosage,
    this.frequency,
    this.startAt,
    this.firstTime,
    this.secondTime,
    this.thirdTime,
    this.endAt
  });

}
