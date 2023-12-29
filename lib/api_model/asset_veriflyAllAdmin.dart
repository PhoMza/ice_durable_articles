class VeriflyAllAdmin {
  String? borrowId;
  String? fig;
  String? userId;
  String? name;
  String? room;
  String? duedate;
  String? status;

  VeriflyAllAdmin(
      {this.borrowId,
      this.fig,
      this.userId,
      this.name,
      this.room,
      this.duedate,
      this.status});

  VeriflyAllAdmin.fromJson(Map<String, dynamic> json) {
    borrowId = json['borrow_id'];
    fig = json['Fig'];
    userId = json['user_id'];
    name = json['Name'];
    room = json['room'];
    duedate = json['duedate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['borrow_id'] = this.borrowId;
    data['Fig'] = this.fig;
    data['user_id'] = this.userId;
    data['Name'] = this.name;
    data['room'] = this.room;
    data['duedate'] = this.duedate;
    data['status'] = this.status;
    return data;
  }
}
