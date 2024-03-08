import 'package:hive/hive.dart';
part 'house_roof_adapter.g.dart';

@HiveType(typeId: 28)
class HouseRoofDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  HouseRoofDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory HouseRoofDB.fromJson(Map<String, dynamic> json) {
    return HouseRoofDB(
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
