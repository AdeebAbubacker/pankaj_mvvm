import 'package:json_annotation/json_annotation.dart';

import 'school.dart';
import 'paginate.dart';

part 'searchschool.g.dart';

@JsonSerializable()
class Searchschool {
	int? status;
	int? count;
	String? message;
	List<School>? data;
	List<dynamic>? misc;
	Paginate? paginate;

	Searchschool({
		this.status, 
		this.count, 
		this.message, 
		this.data, 
		this.misc, 
		this.paginate, 
	});

	factory Searchschool.fromJson(Map<String, dynamic> json) {
		return _$SearchschoolFromJson(json);
	}

	Map<String, dynamic> toJson() => _$SearchschoolToJson(this);
}



