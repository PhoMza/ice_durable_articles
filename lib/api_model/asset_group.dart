class AssetGroup1 {
  //String message;
  String DurableName;
  String Name;
  String Total;
  String Fig;

  AssetGroup1(
      { //required this.message,
      required this.DurableName,
      required this.Name,
      required this.Total,
      required this.Fig});

  factory AssetGroup1.fromJson(Map<String, dynamic> json) {
    return AssetGroup1(
      //message: json['message'] as String,
      DurableName: json['DurableName'] as String,
      Name: json['Name'] as String,
      Total: json['Total'] as String,
      Fig: json['Fig'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['message'] = this.message;
    data['DurableName'] = this.DurableName;
    data['Name'] = this.Name;
    data['Total'] = this.Total;
    data['Fig'] = this.Fig;
    return data;
  }
}


