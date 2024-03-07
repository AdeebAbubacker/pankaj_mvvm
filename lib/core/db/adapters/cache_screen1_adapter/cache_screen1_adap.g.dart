// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_screen1_adap.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class cacheScreen1DBAdapter extends TypeAdapter<cacheScreen1DB> {
  @override
  final int typeId = 17;

  @override
  cacheScreen1DB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return cacheScreen1DB(
      id: fields[0] as int,
      name1: fields[1] as String?,
      name2: fields[2] as String?,
      name3: fields[3] as String?,
      name4: fields[4] as String?,
      name5: fields[5] as String?,
      name6: fields[6] as String?,
      name7: fields[7] as String?,
      gender: fields[8] as int?,
      bankaccstatus: fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, cacheScreen1DB obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name1)
      ..writeByte(2)
      ..write(obj.name2)
      ..writeByte(3)
      ..write(obj.name3)
      ..writeByte(4)
      ..write(obj.name4)
      ..writeByte(5)
      ..write(obj.name5)
      ..writeByte(6)
      ..write(obj.name6)
      ..writeByte(7)
      ..write(obj.name7)
      ..writeByte(8)
      ..write(obj.gender)
      ..writeByte(9)
      ..write(obj.bankaccstatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is cacheScreen1DBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
