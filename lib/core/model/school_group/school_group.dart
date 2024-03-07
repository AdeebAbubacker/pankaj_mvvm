class SchoolGroup {
  final int? id;
  final String? name;
  final dynamic? courses;
  final String? is_practical;

  SchoolGroup({
    this.id,
    this.name,
    this.courses,
    this.is_practical,
  });

  factory SchoolGroup.fromJson(Map<String, dynamic> json) {
    return SchoolGroup(
      id: json['id'],
      name: json['name'],
      courses: json['created_at'],
      is_practical: json['is_practical'],
    );
  }
}
