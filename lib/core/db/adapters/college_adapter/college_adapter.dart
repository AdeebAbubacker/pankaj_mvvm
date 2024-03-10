import 'package:hive_flutter/hive_flutter.dart';
 part 'college_adapter.g.dart';

@HiveType(typeId: 19)
class CollegeDB {
  @HiveField(0)
  int? id;

  @HiveField(1)
  String name;
  
  CollegeDB({
     this.id,
    required this.name,
 
  });

  factory CollegeDB.fromJson(Map<String, dynamic> json) {
    return CollegeDB(
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
