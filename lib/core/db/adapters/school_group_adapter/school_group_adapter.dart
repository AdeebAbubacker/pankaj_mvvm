import 'package:hive_flutter/hive_flutter.dart';
part 'school_group_adapter.g.dart';

@HiveType(typeId: 23)
class SchoolGroupDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

    @HiveField(2)
  dynamic courses;

  SchoolGroupDB({
    required this.id,
    required this.name,
    required this.courses,
  });

  factory SchoolGroupDB.fromJson(Map<String, dynamic> json) {
    return SchoolGroupDB(
      id: json['id'],
      name: json['name'],
      courses: json['courses'] ?? 'hhhhh',
    );
  }
}
