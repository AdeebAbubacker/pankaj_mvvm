// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_group_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SchoolGroupDBAdapter extends TypeAdapter<SchoolGroupDB> {
  @override
  final int typeId = 23;

  @override
  SchoolGroupDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SchoolGroupDB(
      id: fields[0] as int,
      name: fields[1] as String,
      courses: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, SchoolGroupDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.courses);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SchoolGroupDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
