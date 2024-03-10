import 'package:hive_flutter/hive_flutter.dart';
part 'parents_education_adapter.g.dart';

@HiveType(typeId: 25)
class ParentsEducationDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  ParentsEducationDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory ParentsEducationDB.fromJson(Map<String, dynamic> json) {
    return ParentsEducationDB(
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
