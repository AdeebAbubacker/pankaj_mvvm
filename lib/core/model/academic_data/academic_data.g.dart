// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AcademicData _$AcademicDataFromJson(Map<String, dynamic> json) => AcademicData(
      academics: (json['academics'] as List<dynamic>?)
          ?.map((e) => Academic.fromJson(e as Map<String, dynamic>))
          .toList(),
      achievements: (json['achievements'] as List<dynamic>?)
          ?.map((e) => Achievement.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AcademicDataToJson(AcademicData instance) =>
    <String, dynamic>{
      'academics': instance.academics,
      'achievements': instance.achievements,
    };
