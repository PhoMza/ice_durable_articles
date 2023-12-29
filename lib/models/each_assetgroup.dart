class EachAssetGroup {
  //String message;
  String DurableID;
  String Num;
  String Allnum;
  String Fig;
  String Status;
  String QR_ID;
  String Room;

  EachAssetGroup({ //required this.message,
    required this.DurableID,
    required this.Num,
    required this.Allnum,
    required this.Fig,
    required this.Status,
    required this.QR_ID,
    required this.Room,
  });

  factory EachAssetGroup.fromJson(Map<String, dynamic> json) {
    return EachAssetGroup(
      //message: json['message'] as String,
      DurableID: json['DurableID'] as String,
      Num: json['Num'] as String,
      Allnum: json['Allnum'] as String,
      Fig: json['Fig'] as String,
      Status: json['Status'] as String,
      QR_ID: json['QR_ID'] as String,
      Room: json['Room'] as String
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    //data['message'] = this.message;
    data['DurableID'] = this.DurableID;
    data['Num'] = this.Num;
    data['Allnum'] = this.Allnum;
    data['Fig'] = this.Fig;
    data['Status'] = this.Status;
    data['QR_ID'] = this.QR_ID;
    data['Room'] = this.Room;
    return data;
  }
}