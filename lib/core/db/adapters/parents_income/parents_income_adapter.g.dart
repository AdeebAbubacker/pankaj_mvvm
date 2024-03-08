// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parents_income_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParentsIncomeDBAdapter extends TypeAdapter<ParentsIncomeDB> {
  @override
  final int typeId = 26;

  @override
  ParentsIncomeDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParentsIncomeDB(
      id: fields[0] as int,
      name: fields[1] as String,
      status: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParentsIncomeDB obj) {
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
      other is ParentsIncomeDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
