import 'package:json_annotation/json_annotation.dart';

part 'misc.g.dart';

@JsonSerializable()
class Misc {
	int? count;

	Misc({this.count});

	factory Misc.fromJson(Map<String, dynamic> json) => _$MiscFromJson(json);

	Map<String, dynamic> toJson() => _$MiscToJson(this);
}
