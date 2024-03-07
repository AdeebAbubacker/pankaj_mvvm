class AchievmentsData {
  String? achievmentdetails;
  String? category;
  String? upload; // Change to int

  AchievmentsData({
    this.achievmentdetails,
    this.category,
    this.upload,
  });

  // Implement toJson method to convert AchievmentsData to JSON
  Map<String, dynamic> toJson() {
    return {
      "achievmentdetails": achievmentdetails,
      "category": category,
      "upload": upload,
  
    };
  }
}
