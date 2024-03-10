import 'package:hive_flutter/hive_flutter.dart';
part 'rental_house_adapter.g.dart';

@HiveType(typeId: 31)
class RentalHouseDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  RentalHouseDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory RentalHouseDB.fromJson(Map<String, dynamic> json) {
    return RentalHouseDB(
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
