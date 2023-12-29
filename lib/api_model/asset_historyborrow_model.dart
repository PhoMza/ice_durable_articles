class Data_borrow {
  String? borrowId;
  String? userId;
  String? qRCode;
  String? dNumber;
  String? room;
  String? borrowDate;
  String? timeBorrow;
  String? name;
  String? fig;
  String? duedate;
  String? returnDate;
  String? timeReturn;
  String? status;

  Data_borrow(
      {this.borrowId,
      this.userId,
      this.qRCode,
      this.dNumber,
      this.room,
      this.borrowDate,
      this.timeBorrow,
      this.name,
      this.fig,
      this.duedate,
      this.returnDate,
      this.timeReturn,
      this.status});

  Data_borrow.fromJson(Map<String, dynamic> json) {
    borrowId = json['borrow_id'];
    userId = json['user_id'];
    qRCode = json['QR_code'];
    dNumber = json['D_number'];
    room = json['room'];
    borrowDate = json['Borrow_date'];
    timeBorrow = json['Time_borrow'];
    name = json['Name'];
    fig = json['Fig'];
    duedate = json['duedate'];
    returnDate = json['Return_date'];
    timeReturn = json['Time_return'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['borrow_id'] = this.borrowId;
    data['user_id'] = this.userId;
    data['QR_code'] = this.qRCode;
    data['D_number'] = this.dNumber;
    data['room'] = this.room;
    data['Borrow_date'] = this.borrowDate;
    data['Time_borrow'] = this.timeBorrow;
    data['Name'] = this.name;
    data['Fig'] = this.fig;
    data['duedate'] = this.duedate;
    data['Return_date'] = this.returnDate;
    data['Time_return'] = this.timeReturn;
    data['status'] = this.status;
    return data;
  }
}



// class Data_borrow {
//   String? borrowDate;
//   String? timeBorrow;
//   String? name;
//   String? fig;
//   String? duedate;
//   String? returnDate;
//   String? timeReturn;
//   String? status;
//   // String? qrCode;

//   Data_borrow(
//       {this.borrowDate,
//         this.timeBorrow,
//         this.name,
//         this.fig,
//         this.duedate,
//         this.returnDate,
//         this.timeReturn,
//         this.status,
//         // this.qrCode
//         });

//   Data_borrow.fromJson(Map<String, dynamic> json) {
//     borrowDate = json['Borrow_date'];
//     timeBorrow = json['Time_borrow'];
//     name = json['Name'];
//     fig = json['Fig'];
//     duedate = json['duedate'];
//     returnDate = json['Return_date'];
//     timeReturn = json['Time_return'];
//     status = json['status'];
//     // qrCode = json['QR_code'];
//   }



//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['Borrow_date'] = this.borrowDate;
//     data['Time_borrow'] = this.timeBorrow;
//     data['Name'] = this.name;
//     data['Fig'] = this.fig;
//     data['duedate'] = this.duedate;
//     data['Return_date'] = this.returnDate;
//     data['Time_return'] = this.timeReturn;
//     data['status'] = this.status;
//     // data['QR_code'] = this.qrCode;
    
//     return data;
//   }
// }
