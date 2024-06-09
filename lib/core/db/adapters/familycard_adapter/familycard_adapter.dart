import 'package:hive_flutter/hive_flutter.dart';

part 'familycard_adapter.g.dart'; // You need to run the build_runner to generate this file

@HiveType(typeId: 35)
class FamilyCardDB {
  @HiveField(0)
  dynamic fname;

  @HiveField(1)
  bool falive;

  @HiveField(2)
  bool fdisabled;

  @HiveField(3)
  dynamic foccupation;

  @HiveField(4)
  dynamic fincome;

  @HiveField(5)
  dynamic mname;

  @HiveField(6)
  bool malive;

  @HiveField(7)
  bool mdisabled;

  @HiveField(8)
  dynamic moccupation;

  @HiveField(9)
  dynamic mincome;

  @HiveField(10)
  dynamic gname;

  @HiveField(11)
  bool galive;

  @HiveField(12)
  bool gdisabled;

  @HiveField(13)
  dynamic goccupation;

  @HiveField(14)
  dynamic gincome;

  FamilyCardDB({
    this.fname,
    this.falive = true,
    this.fdisabled = false,
    this.foccupation,
    this.fincome,
    this.mname,
    this.malive= true,
    this.mdisabled= false,
    this.moccupation,
    this.mincome,
    this.gname,
    this.galive= true,
    this.gdisabled= false,
    this.goccupation,
    this.gincome,
  });
}
