// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'family_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FamilyData _$FamilyDataFromJson(Map<String, dynamic> json) => FamilyData(
      status: json['status'],
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      misc: json['misc'] == null
          ? null
          : Misc.fromJson(json['misc'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$FamilyDataToJson(FamilyData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'errors': instance.errors,
    };
