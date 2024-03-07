// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searchschool.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Searchschool _$SearchschoolFromJson(Map<String, dynamic> json) => Searchschool(
      status: json['status'] as int?,
      count: json['count'] as int?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => School.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] as List<dynamic>?,
      paginate: json['paginate'] == null
          ? null
          : Paginate.fromJson(json['paginate'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchschoolToJson(Searchschool instance) =>
    <String, dynamic>{
      'status': instance.status,
      'count': instance.count,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'paginate': instance.paginate,
    };
