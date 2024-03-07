class RecipentsModel {
  int id;
  String start_year;
  String name;

  RecipentsModel({
    required this.id,
    required this.start_year,
    required this.name,
  });

  factory RecipentsModel.fromJson(Map<String, dynamic> json) {
    return RecipentsModel(
      id: json['id'] ?? 0,
      start_year: json['start_year'] ?? 'null',
      name: json['name'] ?? 'null',
    );
  }
}
