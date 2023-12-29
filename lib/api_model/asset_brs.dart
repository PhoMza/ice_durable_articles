// import 'dart:convert';

// BRSPOST brspostFromJson(String str) => BRSPOST.fromJson(json.decode(str));

// String brspostToJson(BRSPOST data) => json.encode(data.toJson());

class BRSPOST {
  String borrow;
  String return1;
  String status;

  BRSPOST({
    required this.borrow,
    required this.return1,
    required this.status,
  });

  factory BRSPOST.fromJson(Map<String, dynamic> json) {
    return BRSPOST(
      borrow: json["borrow"] as String,
      return1: json["return1"] as String,
      status: json["status"] as String,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data["borrow"] = this.borrow;
    data["return1"] = this.return1;
    data["status"] = this.status;
    return data;
  }
}











// class AssetBRS {
//   String borrow;
//   String return1;
//   String status;

//   AssetBRS({required this.borrow, required this.return1, required this.status});

//   factory AssetBRS.fromJson(Map<String, dynamic> json) {
//     return AssetBRS(
//       borrow: json['borrow'] as String,
//       return1: json['return1'] as String,
//       status: json['status'] as String,
//     );
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['borrow'] = this.borrow;
//     data['return1'] = this.return1;
//     data['status'] = this.status;
//     return data;
//   }
// }
