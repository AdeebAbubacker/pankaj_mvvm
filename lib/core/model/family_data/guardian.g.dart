// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'guardian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Guardian _$GuardianFromJson(Map<String, dynamic> json) => Guardian(
      studentId: json['student_id'],
      name: json['name'] as String?,
      relation: json['relation'] as String?,
      phone: json['phone'],
      email: json['email'],
      highestQualification: json['highestQualification'],
      occupation: json['occupation'],
      income: json['income'],
      alive: json['alive'],
      disabled: json['disabled'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      id: json['id'],
    );

Map<String, dynamic> _$GuardianToJson(Guardian instance) => <String, dynamic>{
      'student_id': instance.studentId,
      'name': instance.name,
      'relation': instance.relation,
      'phone': instance.phone,
      'email': instance.email,
      'highestQualification': instance.highestQualification,
      'occupation': instance.occupation,
      'income': instance.income,
      'alive': instance.alive,
      'disabled': instance.disabled,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'id': instance.id,
    };
