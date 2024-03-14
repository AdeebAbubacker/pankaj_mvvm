// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_new_invited_student.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateNewInvitedStudent _$CreateNewInvitedStudentFromJson(
        Map<String, dynamic> json) =>
    CreateNewInvitedStudent(
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

Map<String, dynamic> _$CreateNewInvitedStudentToJson(
        CreateNewInvitedStudent instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'misc': instance.misc,
      'errors': instance.errors,
    };
