// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'house_plaster_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HousePlasterDBAdapter extends TypeAdapter<HousePlasterDB> {
  @override
  final int typeId = 29;

  @override
  HousePlasterDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HousePlasterDB(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HousePlasterDB obj) {
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
      other is HousePlasterDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
