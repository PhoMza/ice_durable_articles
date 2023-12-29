class ScanAdminDetails {
  String? username;
  String? returnDate;
  String? timeReturn;
  String? borrowDate;
  String? timeBorrow;

  ScanAdminDetails(
      {this.username,
      this.returnDate,
      this.timeReturn,
      this.borrowDate,
      this.timeBorrow});

  ScanAdminDetails.fromJson(Map<String, dynamic> json) {
    username = json['Username'];
    returnDate = json['Return_Date'];
    timeReturn = json['Time_Return'];
    borrowDate = json['Borrow_date'];
    timeBorrow = json['Time_borrow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Username'] = this.username;
    data['Return_Date'] = this.returnDate;
    data['Time_Return'] = this.timeReturn;
    data['Borrow_date'] = this.borrowDate;
    data['Time_borrow'] = this.timeBorrow;
    return data;
  }
}
