import 'package:json_annotation/json_annotation.dart';

import 'datum.dart';
import 'misc.dart';

part 'students_invite_list_model.g.dart';

@JsonSerializable()
class StudentsInviteListModel {
	bool? status;
	String? message;
	List<Datum>? data;
	Misc? misc;
	List<dynamic>? errors;

	StudentsInviteListModel({
		this.status, 
		this.message, 
		this.data, 
		this.misc, 
		this.errors, 
	});

	factory StudentsInviteListModel.fromJson(Map<String, dynamic> json) {
		return _$StudentsInviteListModelFromJson(json);
	}

	Map<String, dynamic> toJson() => _$StudentsInviteListModelToJson(this);
}
