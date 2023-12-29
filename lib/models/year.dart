class AllYear{
  String Year;

  AllYear(
      {required this.Year,});


  factory AllYear.fromJson(Map<String, dynamic> json) {
    return AllYear(
      Year: json['Year'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Year'] = this.Year;
    return data;
  }
}