// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water_source_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterSourceDBAdapter extends TypeAdapter<WaterSourceDB> {
  @override
  final int typeId = 30;

  @override
  WaterSourceDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WaterSourceDB(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, WaterSourceDB obj) {
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
      other is WaterSourceDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
