import 'package:hive/hive.dart';
part 'house_plaster_adapter.g.dart';

@HiveType(typeId: 29)
class HousePlasterDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  HousePlasterDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory HousePlasterDB.fromJson(Map<String, dynamic> json) {
    return HousePlasterDB(
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
