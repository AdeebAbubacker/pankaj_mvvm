class College {
  final int id;
  final String name;
  final dynamic createdAt;

  College({
    required this.id,
    required this.name,
    required this.createdAt,
  });

  factory College.fromJson(Map<String, dynamic> json) {
    return College(
      id: json['id'],
      name: json['name'],
      createdAt: json['created_at'],
    );
  }
}
