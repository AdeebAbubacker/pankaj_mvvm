import 'package:hive_flutter/hive_flutter.dart';
part 'life_status_adapter.g.dart';

@HiveType(typeId: 24)
class LifeStatusDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  LifeStatusDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory LifeStatusDB.fromJson(Map<String, dynamic> json) {
    return LifeStatusDB(
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
