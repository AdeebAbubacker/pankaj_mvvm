import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';

part 'delete_student_invite_list.g.dart';

@JsonSerializable()
class DeleteStudentInviteList {
	bool? status;
	String? message;
	List<Datum>? data;
	List<dynamic>? misc;
	List<dynamic>? errors;

	DeleteStudentInviteList({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory DeleteStudentInviteList.fromJson(Map<String, dynamic> json) {
		return _$DeleteStudentInviteListFromJson(json);
	}

	Map<String, dynamic> toJson() => _$DeleteStudentInviteListToJson(this);
}
