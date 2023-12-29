class VeriflyDetails {
  String? fig;
  String? userId;
  String? username;
  String? name;
  String? dNumber;
  String? room;
  String? returnDate;
  String? timeReturn;
  String? borrowDate;
  String? timeBorrow;
  String? duedate;

  VeriflyDetails(
      {this.fig,
      this.userId,
      this.username,
      this.name,
      this.dNumber,
      this.room,
      this.returnDate,
      this.timeReturn,
      this.borrowDate,
      this.timeBorrow,
      this.duedate});

  VeriflyDetails.fromJson(Map<String, dynamic> json) {
    fig = json['fig'];
    userId = json['User_id'];
    username = json['Username'];
    name = json['Name'];
    dNumber = json['D_number'];
    room = json['Room'];
    returnDate = json['Return_Date'];
    timeReturn = json['Time_Return'];
    borrowDate = json['Borrow_date'];
    timeBorrow = json['Time_borrow'];
    duedate = json['Duedate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fig'] = this.fig;
    data['User_id'] = this.userId;
    data['Username'] = this.username;
    data['Name'] = this.name;
    data['D_number'] = this.dNumber;
    data['Room'] = this.room;
    data['Return_Date'] = this.returnDate;
    data['Time_Return'] = this.timeReturn;
    data['Borrow_date'] = this.borrowDate;
    data['Time_borrow'] = this.timeBorrow;
    data['Duedate'] = this.duedate;
    return data;
  }
}
