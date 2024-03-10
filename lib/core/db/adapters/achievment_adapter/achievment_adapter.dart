import 'package:hive_flutter/hive_flutter.dart';

part 'achievment_adapter.g.dart';

@HiveType(typeId: 16)
class AchievmentDB {
  @HiveField(0)
  String category;

  @HiveField(1)
  dynamic achievmentController;

  @HiveField(2)
  dynamic uploadfile;

  

  AchievmentDB({
    required this.category,
    required this.achievmentController,
    required this.uploadfile,
   
  });

  factory AchievmentDB.fromJson(Map<String, dynamic> json) {
    return AchievmentDB(
      category: json['category'],
      achievmentController: json['achievmentController'],
      uploadfile: json['uploadfile'],
    
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['achievmentController'] = achievmentController;
    data['uploadfile'] = uploadfile;
    return data;
  }
}
