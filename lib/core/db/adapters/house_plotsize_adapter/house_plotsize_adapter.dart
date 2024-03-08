import 'package:hive/hive.dart';
part 'house_plotsize_adapter.g.dart';

@HiveType(typeId: 27)
class HousePlotSizeDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  HousePlotSizeDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory HousePlotSizeDB.fromJson(Map<String, dynamic> json) {
    return HousePlotSizeDB(
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
