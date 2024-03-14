import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'misc.dart';

part 'create_new_invited_student.g.dart';

@JsonSerializable()
class CreateNewInvitedStudent {
	bool? status;
	String? message;
	List<Datum>? data;
	Misc? misc;
	List<dynamic>? errors;

	CreateNewInvitedStudent({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory CreateNewInvitedStudent.fromJson(Map<String, dynamic> json) {
		return _$CreateNewInvitedStudentFromJson(json);
	}

	Map<String, dynamic> toJson() => _$CreateNewInvitedStudentToJson(this);
}
