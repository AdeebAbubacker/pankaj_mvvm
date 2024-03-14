import 'package:json_annotation/json_annotation.dart';

import 'user.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
	String? message;
	User? user;
	@JsonKey(name: 'access_token') 
	String? accessToken;

	AuthResponse({this.message, this.user, this.accessToken});

	factory AuthResponse.fromJson(Map<String, dynamic> json) {
		return _$AuthResponseFromJson(json);
	}

	Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
