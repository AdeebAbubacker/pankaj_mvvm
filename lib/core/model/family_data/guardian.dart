import 'package:json_annotation/json_annotation.dart';

part 'guardian.g.dart';

@JsonSerializable()
class Guardian {
	@JsonKey(name: 'student_id') 
	dynamic studentId;
	String? name;
	String? relation;
	dynamic phone;
	dynamic email;
	dynamic highestQualification;
	dynamic occupation;
	dynamic income;
	dynamic alive;
	dynamic disabled;
	
	dynamic? updatedAt;

	dynamic? createdAt;
	dynamic id;

	Guardian({
		this.studentId, 
		this.name, 
		this.relation, 
		this.phone, 
		this.email, 
		this.highestQualification, 
		this.occupation, 
		this.income, 
		this.alive, 
		this.disabled, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Guardian.fromJson(Map<String, dynamic> json) {
		return _$GuardianFromJson(json);
	}

	Map<String, dynamic> toJson() => _$GuardianToJson(this);
}
