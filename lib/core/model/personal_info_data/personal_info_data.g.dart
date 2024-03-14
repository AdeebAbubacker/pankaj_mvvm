// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_info_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PersonalInfoData _$PersonalInfoDataFromJson(Map<String, dynamic> json) =>
    PersonalInfoData(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] as List<dynamic>?,
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$PersonalInfoDataToJson(PersonalInfoData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'errors': instance.errors,
    };
