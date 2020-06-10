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
      drugName: fields[0] as String,
      drugType: fields[1] as String,
      dosage: fields[2] as int,
      frequency: fields[3] as String,
      startAt: fields[4] as DateTime,
      time: fields[5] as TimeOfDay,
      time2: fields[7] as TimeOfDay,
      time3: fields[8] as TimeOfDay,
      endAt: fields[6] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(9)
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
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.endAt)
      ..writeByte(7)
      ..write(obj.time2)
      ..writeByte(8)
      ..write(obj.time3);
  }

  @override
  int get typeId => 0;
}
