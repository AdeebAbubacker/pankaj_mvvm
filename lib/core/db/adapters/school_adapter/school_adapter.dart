import 'package:hive_flutter/hive_flutter.dart';
 part 'school_adapter.g.dart';

@HiveType(typeId: 4)
class SchoolDB {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;
  
  SchoolDB({
     this.id,
    required this.name,
 
  });

  factory SchoolDB.fromJson(Map<String, dynamic> json) {
    return SchoolDB(
      id: json['id'],
      name: json['name'],
     
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
