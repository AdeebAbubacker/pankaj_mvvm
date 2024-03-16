class ResidentialData {
  bool? status;
  String? message;
  Data? data;
  Misc? misc;
  List<Null>? errors;

  ResidentialData({
    this.status,
    this.message,
    this.data,
    this.misc,
    this.errors,
  });

  factory ResidentialData.fromJson(Map<String, dynamic> json) {
    return ResidentialData(
      status: json['status'],
      message: json['message'],
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      misc: json['misc'] != null ? Misc.fromJson(json['misc']) : null,
      errors: json['errors'] != null
          ? List<Null>.from(json['errors'].map((x) => x))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.misc != null) {
      data['misc'] = this.misc!.toJson();
    }
    if (this.errors != null) {
      data['errors'] = errors;
    }
    return data;
  }
}

class Data {
  int? houseLandSize;
  int? houseDrinkingWater;
  int? houseRoof;
  int? houseOwnership;

  Data({
    this.houseLandSize,
    this.houseDrinkingWater,
    this.houseRoof,
    this.houseOwnership,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      houseLandSize: json['house_land_size'],
      houseDrinkingWater: json['house_drinking_water'],
      houseRoof: json['house_roof'],
      houseOwnership: json['house_ownership'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['house_land_size'] = houseLandSize;
    data['house_drinking_water'] = houseDrinkingWater;
    data['house_roof'] = houseRoof;
    data['house_ownership'] = houseOwnership;
    return data;
  }
}

class Misc {
  int? count;

  Misc({
    this.count,
  });

  factory Misc.fromJson(Map<String, dynamic> json) {
    return Misc(
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    return data;
  }
}
