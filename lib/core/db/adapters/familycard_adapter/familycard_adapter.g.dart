// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'familycard_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyCardDBAdapter extends TypeAdapter<FamilyCardDB> {
  @override
  final int typeId = 35;

  @override
  FamilyCardDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FamilyCardDB(
      fname: fields[0] as dynamic,
      falive: fields[1] as bool,
      fdisabled: fields[2] as bool,
      foccupation: fields[3] as dynamic,
      fincome: fields[4] as dynamic,
      mname: fields[5] as dynamic,
      malive: fields[6] as bool,
      mdisabled: fields[7] as bool,
      moccupation: fields[8] as dynamic,
      mincome: fields[9] as dynamic,
      gname: fields[10] as dynamic,
      galive: fields[11] as bool,
      gdisabled: fields[12] as bool,
      goccupation: fields[13] as dynamic,
      gincome: fields[14] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, FamilyCardDB obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.fname)
      ..writeByte(1)
      ..write(obj.falive)
      ..writeByte(2)
      ..write(obj.fdisabled)
      ..writeByte(3)
      ..write(obj.foccupation)
      ..writeByte(4)
      ..write(obj.fincome)
      ..writeByte(5)
      ..write(obj.mname)
      ..writeByte(6)
      ..write(obj.malive)
      ..writeByte(7)
      ..write(obj.mdisabled)
      ..writeByte(8)
      ..write(obj.moccupation)
      ..writeByte(9)
      ..write(obj.mincome)
      ..writeByte(10)
      ..write(obj.gname)
      ..writeByte(11)
      ..write(obj.galive)
      ..writeByte(12)
      ..write(obj.gdisabled)
      ..writeByte(13)
      ..write(obj.goccupation)
      ..writeByte(14)
      ..write(obj.gincome);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyCardDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
