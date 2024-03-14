import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? name;
	@JsonKey(name: 'user_id') 
	int? userId;
	@JsonKey(name: 'user_name') 
	String? userName;
	@JsonKey(name: 'school_id') 
	int? schoolId;
	@JsonKey(name: 'school_name') 
	String? schoolName;
	@JsonKey(name: 'referred_by') 
	dynamic referredBy;
	String? email;
	@JsonKey(name: 'need_otp') 
	bool? needOtp;
	@JsonKey(name: 'appl_status') 
	int? applStatus;
	bool? cancelled;
	@JsonKey(name: 'cancel_reason') 
	dynamic cancelReason;

	Datum({
		this.id, 
		this.name, 
		this.userId, 
		this.userName, 
		this.schoolId, 
		this.schoolName, 
		this.referredBy, 
		this.email, 
		this.needOtp, 
		this.applStatus, 
		this.cancelled, 
		this.cancelReason, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
