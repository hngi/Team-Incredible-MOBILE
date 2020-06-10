import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType()
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
  TimeOfDay time;

  @HiveField(6)
  DateTime endAt;

  @HiveField(7)
  TimeOfDay time2;

  @HiveField(8)
  TimeOfDay time3;
  
  Schedule({
  this.drugName,
    this.drugType,
    this.dosage,
    this.frequency,
    this.startAt,
    this.time,
    this.time2,
    this.time3,
    this.endAt
  });

}
