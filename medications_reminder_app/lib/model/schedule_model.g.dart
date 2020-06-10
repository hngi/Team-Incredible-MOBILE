// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule_model.dart';

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
      drugName: fields[0] as String,
      drugType: fields[1] as String,
      dosage: fields[2] as int,
      frequency: fields[3] as String,
      startAt: fields[4] as DateTime,
      firstTime: fields[5] as TimeOfDay,
      secondTime: fields[7] as TimeOfDay,
      thirdTime: fields[8] as TimeOfDay,
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
      ..write(obj.firstTime)
      ..writeByte(6)
      ..write(obj.endAt)
      ..writeByte(7)
      ..write(obj.secondTime)
      ..writeByte(8)
      ..write(obj.thirdTime);
  }
}
