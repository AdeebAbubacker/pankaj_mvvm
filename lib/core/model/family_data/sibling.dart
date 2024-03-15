import 'package:json_annotation/json_annotation.dart';

part 'sibling.g.dart';

@JsonSerializable()
class Sibling {
  @JsonKey(name: 'student_id')
  dynamic studentId;
  dynamic name;
  dynamic gender;

  dynamic highestQualification;
  dynamic course;
  dynamic occupation;

  dynamic updatedAt;
  dynamic createdAt;
  dynamic dynamiccreatedAt;
  int? id;

  Sibling({
    this.studentId,
    this.name,
    this.gender,
    this.highestQualification,
    this.course,
    this.occupation,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  factory Sibling.fromJson(Map<String, dynamic> json) {
    return _$SiblingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SiblingToJson(this);
}
