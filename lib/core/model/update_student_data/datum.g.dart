// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userId: json['user_id'] as int?,
      schoolId: json['school_id'] as int?,
      referredBy: json['referred_by'],
      phone: json['phone'] as int?,
      email: json['email'] as String?,
      needOtp: json['need_otp'] as bool?,
      applStatus: json['appl_status'] as int?,
      cancelled: json['cancelled'] as bool?,
      cancelReason: json['cancel_reason'],
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      deletedAt: json['deleted_at'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'school_id': instance.schoolId,
      'referred_by': instance.referredBy,
      'phone': instance.phone,
      'email': instance.email,
      'need_otp': instance.needOtp,
      'appl_status': instance.applStatus,
      'cancelled': instance.cancelled,
      'cancel_reason': instance.cancelReason,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'deleted_at': instance.deletedAt,
    };
