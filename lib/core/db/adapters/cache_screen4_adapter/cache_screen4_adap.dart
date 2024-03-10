import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'cache_screen4_adap.g.dart';

@HiveType(typeId: 18)
class cacheScreen4DB {
  @HiveField(0)
  String? land;
  @HiveField(1)
   bool? ownhouse;

  @HiveField(2)
   bool? rentalhouse;
  @HiveField(3)
   bool? sheet;
  @HiveField(4)
   bool? concrete;

  @HiveField(5)
   bool? tilled;
  @HiveField(6)
   bool? pipewater;

  @HiveField(7)
   bool? wellwater;

  @HiveField(8)
   bool? othersource;

  cacheScreen4DB({
     this.ownhouse,
     this.rentalhouse,
     this.sheet,
     this.concrete,
     this.tilled,
     this.pipewater,
     this.wellwater,
     this.othersource,
     this.land,
  });

  factory cacheScreen4DB.fromJson(Map<String, dynamic> json) {
    return cacheScreen4DB(
      ownhouse: json['ownhouse'],
      rentalhouse: json['rentalhouse'],
      sheet: json['sheet'],
      concrete: json['concrete'],
      tilled: json['tilled'],
      pipewater: json['pipewater'],
      wellwater: json['wellwater'],
      othersource: json['othersource'],
      land: json['land'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ownhouse'] = ownhouse;
    data['rentalhouse'] = rentalhouse;
    data['sheet'] = sheet;
    data['concrete'] = concrete;
    data['tilled'] = tilled;
    data['pipewater'] = pipewater;
    data['wellwater'] = wellwater;
    data['othersource'] = othersource;
    data['land'] = land;
    return data;
  }
}
