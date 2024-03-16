// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'academic.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Academic _$AcademicFromJson(Map<String, dynamic> json) => Academic(
      markSslc: json['mark_sslc'] as int?,
      markP1: json['mark_p1'] as int?,
      markP2: json['mark_p2'] as int?,
      schoolId: json['school_id'] as int?,
      hallTicket: json['hall_ticket'] as int?,
      preferredCourse: json['preferred_course'] as int?,
    );

Map<String, dynamic> _$AcademicToJson(Academic instance) => <String, dynamic>{
      'mark_sslc': instance.markSslc,
      'mark_p1': instance.markP1,
      'mark_p2': instance.markP2,
      'school_id': instance.schoolId,
      'hall_ticket': instance.hallTicket,
      'preferred_course': instance.preferredCourse,
    };
