import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	String? name;
	String? gender;
	DateTime? dob;
	String? email;
	String? phone;
	String? address;
	@JsonKey(name: 'bank_id') 
	int? bankId;
	@JsonKey(name: 'bank_acc_no') 
	String? bankAccNo;
	@JsonKey(name: 'bank_acc_name') 
	String? bankAccName;
	@JsonKey(name: 'bank_ifsc') 
	String? bankIfsc;
	@JsonKey(name: 'updated_at') 
	DateTime? updatedAt;
	@JsonKey(name: 'created_at') 
	DateTime? createdAt;
	int? id;

	Datum({
		this.name, 
		this.gender, 
		this.dob, 
		this.email, 
		this.phone, 
		this.address, 
		this.bankId, 
		this.bankAccNo, 
		this.bankAccName, 
		this.bankIfsc, 
		this.updatedAt, 
		this.createdAt, 
		this.id, 
	});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
