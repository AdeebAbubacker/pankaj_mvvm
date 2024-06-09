// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academics_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AcademicsDBAdapter extends TypeAdapter<AcademicsDB> {
  @override
  final int typeId = 34;

  @override
  AcademicsDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AcademicsDB(
      schoolName: fields[0] as String,
      regNo: fields[1] as String,
      sslcMark: fields[2] as String,
      plusOneMark: fields[3] as String,
      plusTwoMark: fields[4] as String,
      prefForHigher: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AcademicsDB obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.schoolName)
      ..writeByte(1)
      ..write(obj.regNo)
      ..writeByte(2)
      ..write(obj.sslcMark)
      ..writeByte(3)
      ..write(obj.plusOneMark)
      ..writeByte(4)
      ..write(obj.plusTwoMark)
      ..writeByte(5)
      ..write(obj.prefForHigher);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AcademicsDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
