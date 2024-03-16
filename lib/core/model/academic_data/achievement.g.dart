// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Achievement _$AchievementFromJson(Map<String, dynamic> json) => Achievement(
      category: json['category'] as int?,
      achievementDetails: json['achievement_details'] as int?,
      uploadFile: json['upload_file'] as int?,
    );

Map<String, dynamic> _$AchievementToJson(Achievement instance) =>
    <String, dynamic>{
      'category': instance.category,
      'achievement_details': instance.achievementDetails,
      'upload_file': instance.uploadFile,
    };
