class Applicants {
  int id;
  String name;
  String school_name;

  Applicants({
    required this.id,
    required this.name,
    required this.school_name,
  });

  factory Applicants.fromJson(Map<String, dynamic> json) {
    return Applicants(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'null',
      school_name: json['school_name'] ?? 'null',
    );
  }
}

class Schools {
  final int id;
  final String name;

  Schools({
    required this.id,
    required this.name,
  });

  factory Schools.fromJson(Map<String, dynamic> json) {
    return Schools(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'null',
    );
  }
}
