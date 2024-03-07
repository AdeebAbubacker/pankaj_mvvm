// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_qualification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchQualification _$SearchQualificationFromJson(Map<String, dynamic> json) =>
    SearchQualification(
      status: json['status'] as int?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => QualificationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchQualificationToJson(
        SearchQualification instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'message': instance.message,
      'data': instance.data,
    };

QualificationData _$QualificationDataFromJson(Map<String, dynamic> json) =>
    QualificationData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      status: json['status'] as bool?,
      deleted_at: json['deleted_at'],
    );

Map<String, dynamic> _$QualificationDataToJson(QualificationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'deleted_at': instance.deleted_at,
    };
