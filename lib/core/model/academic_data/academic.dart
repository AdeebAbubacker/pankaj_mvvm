import 'package:json_annotation/json_annotation.dart';

part 'academic.g.dart';

@JsonSerializable()
class Academic {
	@JsonKey(name: 'mark_sslc') 
	int? markSslc;
	@JsonKey(name: 'mark_p1') 
	int? markP1;
	@JsonKey(name: 'mark_p2') 
	int? markP2;
	@JsonKey(name: 'school_id') 
	int? schoolId;
	@JsonKey(name: 'hall_ticket') 
	int? hallTicket;
	@JsonKey(name: 'preferred_course') 
	int? preferredCourse;

	Academic({
		this.markSslc, 
		this.markP1, 
		this.markP2, 
		this.schoolId, 
		this.hallTicket, 
		this.preferredCourse, 
	});

	factory Academic.fromJson(Map<String, dynamic> json) {
		return _$AcademicFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AcademicToJson(this);
}
