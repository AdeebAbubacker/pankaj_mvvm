// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      id: json['id'] as int?,
      name: json['name'] as String?,
      userId: json['user_id'] as int?,
      userName: json['user_name'] as String?,
      schoolId: json['school_id'] as int?,
      schoolName: json['school_name'] as String?,
      referredBy: json['referred_by'],
      email: json['email'] as String?,
      needOtp: json['need_otp'] as bool?,
      applStatus: json['appl_status'] as int?,
      cancelled: json['cancelled'] as bool?,
      cancelReason: json['cancel_reason'],
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'user_id': instance.userId,
      'user_name': instance.userName,
      'school_id': instance.schoolId,
      'school_name': instance.schoolName,
      'referred_by': instance.referredBy,
      'email': instance.email,
      'need_otp': instance.needOtp,
      'appl_status': instance.applStatus,
      'cancelled': instance.cancelled,
      'cancel_reason': instance.cancelReason,
    };
