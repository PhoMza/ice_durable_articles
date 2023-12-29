class UpdateReturn {
  String? ReturnSuccess;

  UpdateReturn({this.ReturnSuccess});

  UpdateReturn.fromJson(Map<String, dynamic> json) {
    ReturnSuccess = json['Secces'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Secces'] = this.ReturnSuccess;
    return data;
  }
}
