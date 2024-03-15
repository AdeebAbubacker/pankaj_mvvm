// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sibling.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sibling _$SiblingFromJson(Map<String, dynamic> json) => Sibling(
      studentId: json['student_id'],
      name: json['name'],
      gender: json['gender'],
      highestQualification: json['highestQualification'],
      course: json['course'],
      occupation: json['occupation'],
      updatedAt: json['updatedAt'],
      createdAt: json['createdAt'],
      id: json['id'] as int?,
    )..dynamiccreatedAt = json['dynamiccreatedAt'];

Map<String, dynamic> _$SiblingToJson(Sibling instance) => <String, dynamic>{
      'student_id': instance.studentId,
      'name': instance.name,
      'gender': instance.gender,
      'highestQualification': instance.highestQualification,
      'course': instance.course,
      'occupation': instance.occupation,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'dynamiccreatedAt': instance.dynamiccreatedAt,
      'id': instance.id,
    };
