// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sibling_data_FV_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SiblingDataFVDBAdapter extends TypeAdapter<SiblingDataFVDB> {
  @override
  final int typeId = 33;

  @override
  SiblingDataFVDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SiblingDataFVDB(
      qualification: fields[0] as int,
      life_status: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SiblingDataFVDB obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.qualification)
      ..writeByte(1)
      ..write(obj.life_status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SiblingDataFVDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
