import 'package:json_annotation/json_annotation.dart';

part 'datum.g.dart';

@JsonSerializable()
class Datum {
	String? name;
	@JsonKey(name: 'school_id') 
	String? schoolId;
	String? email;
	String? phone;

	Datum({this.name, this.schoolId, this.email, this.phone});

	factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

	Map<String, dynamic> toJson() => _$DatumToJson(this);
}
