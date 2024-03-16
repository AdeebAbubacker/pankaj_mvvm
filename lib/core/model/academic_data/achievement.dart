import 'package:json_annotation/json_annotation.dart';

part 'achievement.g.dart';

@JsonSerializable()
class Achievement {
	int? category;
	@JsonKey(name: 'achievement_details') 
	int? achievementDetails;
	@JsonKey(name: 'upload_file') 
	int? uploadFile;

	Achievement({this.category, this.achievementDetails, this.uploadFile});

	factory Achievement.fromJson(Map<String, dynamic> json) {
		return _$AchievementFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AchievementToJson(this);
}
