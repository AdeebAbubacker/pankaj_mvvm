// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'students_invite_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentsInviteListModel _$StudentsInviteListModelFromJson(
        Map<String, dynamic> json) =>
    StudentsInviteListModel(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] == null
          ? null
          : Misc.fromJson(json['misc'] as Map<String, dynamic>),
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$StudentsInviteListModelToJson(
        StudentsInviteListModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'errors': instance.errors,
    };
