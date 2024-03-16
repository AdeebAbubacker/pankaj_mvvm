import 'package:json_annotation/json_annotation.dart';

import 'academic.dart';
import 'achievement.dart';

part 'academic_data.g.dart';

@JsonSerializable()
class AcademicData {
	List<Academic>? academics;
	List<Achievement>? achievements;

	AcademicData({this.academics, this.achievements});

	factory AcademicData.fromJson(Map<String, dynamic> json) {
		return _$AcademicDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AcademicDataToJson(this);
}
