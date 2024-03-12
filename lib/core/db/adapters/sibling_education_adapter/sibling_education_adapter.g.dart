// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sibling_education_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiblingEducationDBAdapter extends TypeAdapter<SiblingEducationDB> {
  @override
  final int typeId = 32;

  @override
  SiblingEducationDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SiblingEducationDB(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SiblingEducationDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiblingEducationDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
