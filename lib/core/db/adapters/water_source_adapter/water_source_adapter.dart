
import 'package:hive_flutter/hive_flutter.dart';

part 'water_source_adapter.g.dart';

@HiveType(typeId: 30)
class WaterSourceDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  WaterSourceDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory WaterSourceDB.fromJson(Map<String, dynamic> json) {
    return WaterSourceDB(
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
