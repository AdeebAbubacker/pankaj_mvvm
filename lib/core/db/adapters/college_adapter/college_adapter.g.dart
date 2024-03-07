// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'college_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CollegeDBAdapter extends TypeAdapter<CollegeDB> {
  @override
  final int typeId = 19;

  @override
  CollegeDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CollegeDB(
      id: fields[0] as int?,
      name: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CollegeDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CollegeDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
