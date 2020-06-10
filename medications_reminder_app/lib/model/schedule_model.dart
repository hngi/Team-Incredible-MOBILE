import 'package:hive/hive.dart';

part 'schedule_model.g.dart';

@HiveType(typeId: 0)
class Schedule extends HiveObject{
  @HiveField(0)
  String name;

  @HiveField(1)
  String drugType;

  @HiveField(2)
  int duration;

  @HiveField(3)
  int frequency;

  @HiveField(4)
  DateTime startAt;

  @HiveField(5)
  DateTime time;

  @HiveField(6)
  DateTime endAt;
  
  Schedule({
  this.name,
    this.drugType,
    this.duration,
    this.frequency,
    this.startAt,
    this.time,
    this.endAt
  });

}
