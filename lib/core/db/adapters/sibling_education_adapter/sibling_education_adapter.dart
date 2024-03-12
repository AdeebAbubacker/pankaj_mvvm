import 'package:hive_flutter/hive_flutter.dart';
part 'sibling_education_adapter.g.dart';

@HiveType(typeId: 32)
class SiblingEducationDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  SiblingEducationDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory SiblingEducationDB.fromJson(Map<String, dynamic> json) {
    return SiblingEducationDB(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['status'] = status;
    return data;
  }
}
