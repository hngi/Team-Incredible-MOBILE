// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleAdapter extends TypeAdapter<Schedule> {
  @override
  Schedule read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Schedule(
      index: fields[9] as String,
      drugName: fields[0] as String,
      drugType: fields[1] as String,
      dosage: fields[2] as int,
      frequency: fields[3] as String,
      startAt: fields[4] as DateTime,
      firstTime: (fields[6] as List)?.cast<int>(),
      secondTime: (fields[7] as List)?.cast<int>(),
      thirdTime: (fields[8] as List)?.cast<int>(),
      endAt: fields[5] as DateTime,
    )..id = fields[10] as int;
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.drugName)
      ..writeByte(1)
      ..write(obj.drugType)
      ..writeByte(2)
      ..write(obj.dosage)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.startAt)
      ..writeByte(5)
      ..write(obj.endAt)
      ..writeByte(6)
      ..write(obj.firstTime)
      ..writeByte(7)
      ..write(obj.secondTime)
      ..writeByte(8)
      ..write(obj.thirdTime)
      ..writeByte(9)
      ..write(obj.index)
      ..writeByte(10)
      ..write(obj.id);
  }

  @override
  int get typeId => 0;
}
