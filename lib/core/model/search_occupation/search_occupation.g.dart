// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_occupation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchOccupation _$SearchOccupationFromJson(Map<String, dynamic> json) =>
    SearchOccupation(
      status: json['status'] as int?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => OccupationData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchOccupationToJson(SearchOccupation instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'message': instance.message,
      'data': instance.data,
    };

OccupationData _$OccupationDataFromJson(Map<String, dynamic> json) =>
    OccupationData(
      id: json['id'] as int?,
      name: json['name'] as String?,
      active: json['active'] as int?,
      deleted_at: json['deleted_at'],
    );

Map<String, dynamic> _$OccupationDataToJson(OccupationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'active': instance.active,
      'deleted_at': instance.deleted_at,
    };
