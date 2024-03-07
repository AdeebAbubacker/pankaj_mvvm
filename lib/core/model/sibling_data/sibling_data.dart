class SiblingData {
  String   ?name;
 String ?gender;
   int ?qualification; // Change to int
   int ?course; // Change to int
   int ?occupation; // Change to int

  SiblingData({
     this.name,
     this.gender,
     this.qualification,
     this.course,
     this.occupation,
  });

  // Implement toJson method to convert SiblingData to JSON
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "gender": gender,
      "qualification": qualification,
      "course": course,
      "occupation": occupation,
    };
  }
}
