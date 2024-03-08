import 'package:hive/hive.dart';
part 'parents_income_adapter.g.dart';

@HiveType(typeId: 26)
class ParentsIncomeDB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String status;

  ParentsIncomeDB({
    required this.id,
    required this.name,
    required this.status,
  });

  factory ParentsIncomeDB.fromJson(Map<String, dynamic> json) {
    return ParentsIncomeDB(
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
