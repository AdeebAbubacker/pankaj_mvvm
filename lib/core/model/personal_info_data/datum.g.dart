// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'datum.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      name: json['name'] as String?,
      gender: json['gender'] as String?,
      dob: json['dob'] == null ? null : DateTime.parse(json['dob'] as String),
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
      bankId: json['bank_id'] as int?,
      bankAccNo: json['bank_acc_no'] as String?,
      bankAccName: json['bank_acc_name'] as String?,
      bankIfsc: json['bank_ifsc'] as String?,
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      id: json['id'] as int?,
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'name': instance.name,
      'gender': instance.gender,
      'dob': instance.dob?.toIso8601String(),
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'bank_id': instance.bankId,
      'bank_acc_no': instance.bankAccNo,
      'bank_acc_name': instance.bankAccName,
      'bank_ifsc': instance.bankIfsc,
      'updated_at': instance.updatedAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
    };
