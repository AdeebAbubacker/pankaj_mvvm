import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'cache_screen1_adap.g.dart';

@HiveType(typeId: 17)
class cacheScreen1DB {
  @HiveField(0)
  int id;

  @HiveField(1)
  String? name1;

  @HiveField(2)
  String? name2;

  @HiveField(3)
  String? name3;

  @HiveField(4)
  String? name4;
  @HiveField(5)
  String? name5;
  @HiveField(6)
  String? name6;
  @HiveField(7)
  String? name7;
  @HiveField(8)
  int? gender;

  @HiveField(9)
  bool? bankaccstatus;
  cacheScreen1DB({
    required this.id,
    this.name1,
    this.name2,
    this.name3,
    this.name4,
    this.name5,
    this.name6,
    this.name7,
    this.gender,
    this.bankaccstatus,
  });

  factory cacheScreen1DB.fromJson(Map<String, dynamic> json) {
    return cacheScreen1DB(
      id: json['id'],
      name1: json['name1'],
      name2: json['name2'],
      name3: json['name3'],
      name4: json['name4'],
      name5: json['name5'],
      name6: json['name6'],
      name7: json['name7'],
      gender: json['gender'],
      bankaccstatus: json['bankaccstatus'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name1'] = name1;
    data['name2'] = name2;
    data['name3'] = name3;
    data['name4'] = name4;
    data['name5'] = name5;
    data['name6'] = name6;
    data['name7'] = name7;
    data['gender'] = gender;
    data['bankaccstatus'] = bankaccstatus;
    return data;
  }
}
