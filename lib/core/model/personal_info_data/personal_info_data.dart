import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'personal_info_data.g.dart';

@JsonSerializable()
class PersonalInfoData {
	bool? status;
	String? message;
	List<Datum>? data;
	 Map<String, dynamic>? misc;
	List<dynamic>? errors;

	PersonalInfoData({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory PersonalInfoData.fromJson(Map<String, dynamic> json) {
		return _$PersonalInfoDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$PersonalInfoDataToJson(this);
}
