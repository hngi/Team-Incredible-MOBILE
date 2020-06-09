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
    return Schedule()
      ..name = fields[0] as String
      ..drugType = fields[1] as String
      ..duration = fields[2] as int
      ..frequency = fields[3] as int
      ..startAt = fields[4] as DateTime
      ..time = fields[5] as DateTime
      ..endAt = fields[6] as DateTime;
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.drugType)
      ..writeByte(2)
      ..write(obj.duration)
      ..writeByte(3)
      ..write(obj.frequency)
      ..writeByte(4)
      ..write(obj.startAt)
      ..writeByte(5)
      ..write(obj.time)
      ..writeByte(6)
      ..write(obj.endAt);
  }

  @override
  // TODO: implement typeId
  int get typeId => null;
}
