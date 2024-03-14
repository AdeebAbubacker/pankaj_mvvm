import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'update_student_data.g.dart';

@JsonSerializable()
class UpdateStudentData {
	bool? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	List<dynamic>? errors;

	UpdateStudentData({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory UpdateStudentData.fromJson(Map<String, dynamic> json) {
		return _$UpdateStudentDataFromJson(json);
	}

	Map<String, dynamic> toJson() => _$UpdateStudentDataToJson(this);
}
