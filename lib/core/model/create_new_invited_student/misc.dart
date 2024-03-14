import 'package:json_annotation/json_annotation.dart';

part 'misc.g.dart';

@JsonSerializable()
class Misc {
	@JsonKey(name: 'user_id') 
	int? userId;

	Misc({this.userId});

	factory Misc.fromJson(Map<String, dynamic> json) => _$MiscFromJson(json);

	Map<String, dynamic> toJson() => _$MiscToJson(this);
}
