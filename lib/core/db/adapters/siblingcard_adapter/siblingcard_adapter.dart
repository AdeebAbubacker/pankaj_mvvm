import 'package:hive_flutter/hive_flutter.dart';

part 'siblingcard_adapter.g.dart'; // You need to run the build_runner to generate this file

@HiveType(typeId: 15)
class SiblingCardDB {
 
    @HiveField(0)
  var name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
  final int qualification;

  @HiveField(3)
  final int courseofstudy;

  @HiveField(4)
  final int occupation;

  SiblingCardDB({
    required this.name,
    required this.gender,
    required this.qualification,
    required this.courseofstudy,
    required this.occupation,
  });
}
