class LifeStatus {
  final int? id;
  final String? name;
  final int? status;

  LifeStatus({
    this.id,
    this.name,
    this.status,
  });

  factory LifeStatus.fromJson(Map<String, dynamic> json) {
    return LifeStatus(
      id: json['id'],
      name: json['name'],
      status: json['status'],
    );
  }
}
