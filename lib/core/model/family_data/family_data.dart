import 'package:json_annotation/json_annotation.dart';

import 'data.dart';
import 'misc.dart';

part 'family_data.g.dart';

@JsonSerializable()
class FamilyData {
	dynamic? status;
	String? message;
	Data? data;
	Misc? misc;
	List<dynamic>? errors;

	FamilyData({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory FamilyData.fromJson(Map<String, dynamic> json) {
		return _$FamilyDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$FamilyDataToJson(this);
}
