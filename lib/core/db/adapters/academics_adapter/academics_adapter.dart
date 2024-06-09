import 'package:hive_flutter/hive_flutter.dart';

part 'academics_adapter.g.dart';

@HiveType(typeId: 34)
class AcademicsDB {
  @HiveField(0)
  String schoolName;
  @HiveField(1)
  String regNo;
  @HiveField(2)
  String sslcMark;
  @HiveField(3)
  String plusOneMark;
  @HiveField(4)
  String plusTwoMark;
  @HiveField(5)
  String prefForHigher;

  AcademicsDB({
    this.schoolName = '',
    this.regNo = '',
    this.sslcMark = '',
    this.plusOneMark = '',
    this.plusTwoMark = '',
    this.prefForHigher = '',
  });

  factory AcademicsDB.fromJson(Map<String, dynamic> json) {
    return AcademicsDB(
      schoolName: json['schoolName'],
      regNo: json['regNo'],
      sslcMark: json['sslcMark'],
      plusOneMark: json['plusOneMark'],
      plusTwoMark: json['plusTwoMark'],
      prefForHigher: json['prefForHigher'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schoolName'] = schoolName;
    data['regNo'] = regNo;
    data['sslcMark'] = sslcMark;
    data['plusOneMark'] = plusOneMark;
    data['plusTwoMark'] = plusTwoMark;
    data['prefForHigher'] = prefForHigher;
    return data;
  }
}
