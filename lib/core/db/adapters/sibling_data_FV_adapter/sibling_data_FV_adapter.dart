import 'package:hive_flutter/hive_flutter.dart';

part 'sibling_data_FV_adapter.g.dart'; // You need to run the build_runner to generate this file

@HiveType(typeId: 33)
class SiblingDataFVDB {
 
    @HiveField(0)
  final int qualification;

  @HiveField(1)
  final bool life_status;



  SiblingDataFVDB({
    required this.qualification,
    required this.life_status,

  });
}
