// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ScheduleAdapter extends TypeAdapter<Schedule> {
  @override
  final typeId = 0;

  @override
  Schedule read(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Schedule(
      name: fields[0] as String,
      frequency: fields[2] as String,
      drugType: fields[1] as String,
      dosage: fields[3] as int,
      endDate: fields[8] as DateTime,
      startDate: fields[7] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.drugType)
      ..writeByte(2)
      ..write(obj.frequency)
      ..writeByte(3)
      ..write(obj.dosage)
      ..writeByte(7)
      ..write(obj.startDate)
      ..writeByte(8)
      ..write(obj.endDate);
  }
}

class TimeOfDayAdapter extends TypeAdapter<Schedule> {
  @override
  final typeId = 2;

  @override
  void write(BinaryWriter writer, Schedule obj) {
    writer
      ..writeByte(2)
      ..writeByte(4)
      ..write(obj.firstTime)
      ..writeByte(5)
      ..write(obj.secondTime)
      ..writeByte(6)
      ..write(obj.thirdTime);
  }

  TimeOfDay time(BinaryReader reader) {
    var numOfFields = reader.readByte();
    var fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TimeOfDay(hour: fields[0] as int, minute: fields[1] as int);
  }

  @override
  Schedule read(BinaryReader reader) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
