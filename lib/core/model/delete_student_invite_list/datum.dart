import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	int? id;
	String? name;
	@JsonKey(name: 'user_id') 
	int? userId;
	@JsonKey(name: 'school_id') 
	int? schoolId;
	@JsonKey(name: 'referred_by') 
	dynamic referredBy;
	int? phone;
	String? email;
	@JsonKey(name: 'need_otp') 
	bool? needOtp;
	@JsonKey(name: 'appl_status') 
	int? applStatus;
	bool? cancelled;
	@JsonKey(name: 'cancel_reason') 
	int? cancelReason;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'deleted_at') 
	DateTime? deletedAt;

	Datum({
		this.id, 
		this.name, 
		this.userId, 
		this.schoolId, 
		this.referredBy, 
		this.phone, 
		this.email, 
		this.needOtp, 
		this.applStatus, 
		this.cancelled, 
		this.cancelReason, 
		this.createdAt, 
		this.updatedAt, 
		this.deletedAt, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
