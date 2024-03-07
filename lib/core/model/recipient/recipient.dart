class Recipient {
  final int id;
  final int start_year;
  final String name;


  Recipient({
    required this.id,
    required this.start_year,
    required this.name,
   
  });

  factory Recipient.fromJson(Map<String, dynamic> json) {
    return Recipient(
      id: json['id'],
      start_year: json['start_year'],
      name: json['name'],
  
    );
  }

 
}
