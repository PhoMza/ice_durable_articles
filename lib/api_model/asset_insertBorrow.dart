class InsertBorrow {
  String? BorrowSuccess;

  InsertBorrow({this.BorrowSuccess});

  InsertBorrow.fromJson(Map<String, dynamic> json) {
    BorrowSuccess = json['Success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Success'] = this.BorrowSuccess;
    return data;
  }
}
