// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_bank.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BankData _$BankDataFromJson(Map<String, dynamic> json) => BankData(
      count: json['count'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Bank.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      misc: json['misc'] as List<dynamic>?,
    );

Map<String, dynamic> _$BankDataToJson(BankData instance) => <String, dynamic>{
      'count': instance.count,
      'data': instance.data,
      'message': instance.message,
      'misc': instance.misc,
    };

Bank _$BankFromJson(Map<String, dynamic> json) => Bank(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$BankToJson(Bank instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
