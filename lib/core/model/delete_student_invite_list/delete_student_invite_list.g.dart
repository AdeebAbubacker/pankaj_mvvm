// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delete_student_invite_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeleteStudentInviteList _$DeleteStudentInviteListFromJson(
        Map<String, dynamic> json) =>
    DeleteStudentInviteList(
      status: json['status'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      misc: json['misc'] as List<dynamic>?,
      errors: json['errors'] as List<dynamic>?,
    );

Map<String, dynamic> _$DeleteStudentInviteListToJson(
        DeleteStudentInviteList instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'errors': instance.errors,
    };
