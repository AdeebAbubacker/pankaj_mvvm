// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievment_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AchievmentDBAdapter extends TypeAdapter<AchievmentDB> {
  @override
  final int typeId = 16;

  @override
  AchievmentDB read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AchievmentDB(
      category: fields[0] as String,
      achievmentController: fields[1] as dynamic,
      uploadfile: fields[2] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, AchievmentDB obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.achievmentController)
      ..writeByte(2)
      ..write(obj.uploadfile);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AchievmentDBAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
