// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'occupation_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OccupationDBAdapter extends TypeAdapter<OccupationDB> {
  @override
  final int typeId = 7;

  @override
  OccupationDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OccupationDB(
      id: fields[0] as int,
      name: fields[1] as String,
      active: fields[2] as int,
      deleted_at: fields[3] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, OccupationDB obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.active)
      ..writeByte(3)
      ..write(obj.deleted_at);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OccupationDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
