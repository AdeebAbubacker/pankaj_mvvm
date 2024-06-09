import 'package:hive_flutter/hive_flutter.dart';

part 'siblingcard_adapter.g.dart'; // You need to run the build_runner to generate this file

@HiveType(typeId: 15)
class SiblingCardDB {
 
    @HiveField(0)
  var name;

  @HiveField(1)
  final String gender;

  @HiveField(2)
   String? qualification;

  @HiveField(3)
  final String courseofstudy;

  @HiveField(4)
  final String occupation;

  SiblingCardDB({
    required this.name,
    required this.gender,
    required this.qualification,
    required this.courseofstudy,
    required this.occupation,
  });
}
