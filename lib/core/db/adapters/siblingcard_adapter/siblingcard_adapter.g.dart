// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'siblingcard_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiblingCardDBAdapter extends TypeAdapter<SiblingCardDB> {
  @override
  final int typeId = 15;

  @override
  SiblingCardDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SiblingCardDB(
      name: fields[0] as dynamic,
      gender: fields[1] as String,
      qualification: fields[2] as int,
      courseofstudy: fields[3] as int,
      occupation: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SiblingCardDB obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.gender)
      ..writeByte(2)
      ..write(obj.qualification)
      ..writeByte(3)
      ..write(obj.courseofstudy)
      ..writeByte(4)
      ..write(obj.occupation);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiblingCardDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
