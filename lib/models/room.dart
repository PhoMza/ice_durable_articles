class AllRoom{
  String Roomname;
  String Fig;
  String Buding;
  String NumberOfAssets;

  AllRoom(
      {required this.Roomname,
      required this.Fig,
      required this.Buding,
      required this.NumberOfAssets});


  factory AllRoom.fromJson(Map<String, dynamic> json) {
    return AllRoom(
      Roomname: json['Roomname'] as String,
      Fig: json['Fig'] as String,
      Buding: json['Buding'] as String,
      NumberOfAssets: json['NumberOfAssets'] as String
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Roomname'] = this.Roomname;
    data['Fig'] = this.Fig;
    data['Buding'] = this.Buding;
    data['NumberOfAssets'] = this.NumberOfAssets;
    return data;
  }
}