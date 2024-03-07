// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_screen4_adap.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class cacheScreen4DBAdapter extends TypeAdapter<cacheScreen4DB> {
  @override
  final int typeId = 18;

  @override
  cacheScreen4DB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return cacheScreen4DB(
      ownhouse: fields[1] as bool?,
      rentalhouse: fields[2] as bool?,
      sheet: fields[3] as bool?,
      concrete: fields[4] as bool?,
      tilled: fields[5] as bool?,
      pipewater: fields[6] as bool?,
      wellwater: fields[7] as bool?,
      othersource: fields[8] as bool?,
      land: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, cacheScreen4DB obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.land)
      ..writeByte(1)
      ..write(obj.ownhouse)
      ..writeByte(2)
      ..write(obj.rentalhouse)
      ..writeByte(3)
      ..write(obj.sheet)
      ..writeByte(4)
      ..write(obj.concrete)
      ..writeByte(5)
      ..write(obj.tilled)
      ..writeByte(6)
      ..write(obj.pipewater)
      ..writeByte(7)
      ..write(obj.wellwater)
      ..writeByte(8)
      ..write(obj.othersource);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is cacheScreen4DBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
