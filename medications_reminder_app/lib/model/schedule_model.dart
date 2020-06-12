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
  DateTime endAt;

  @HiveField(6)
  List<int> firstTime;

  @HiveField(7)
  List<int> secondTime;

  @HiveField(8)
  List<int> thirdTime;

  @HiveField(9)
  String index;

  @HiveField(10)
  int id;
  
  Schedule({
    this.index,
  this.drugName,
    this.drugType,
    this.dosage,
    this.frequency,
    this.startAt,
    this.firstTime,
    this.secondTime,
    this.thirdTime,
    this.endAt,
    this.id
  });

}
