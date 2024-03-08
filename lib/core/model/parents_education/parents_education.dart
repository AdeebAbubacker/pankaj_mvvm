class FieldVerificationModel{
  final int? id;
  final String? name;
  final int? status;

  FieldVerificationModel({
    this.id,
    this.name,
    this.status,
  });

  factory FieldVerificationModel.fromJson(Map<String, dynamic> json) {
    return FieldVerificationModel(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
