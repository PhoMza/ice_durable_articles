class FollowStatusAdmin {
  String? borrowId;
  String? userId;
  String? room;
  String? name;
  String? fig;
  String? duedate;
  String? status;

  FollowStatusAdmin(
      {this.borrowId,
      this.userId,
      this.room,
      this.name,
      this.fig,
      this.duedate,
      this.status
      });

  FollowStatusAdmin.fromJson(Map<String, dynamic> json) {
    borrowId = json['Borrow_id'];
    userId = json['user_id'];
    room = json['room'];
    name = json['Name'];
    fig = json['Fig'];
    duedate = json['duedate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Borrow_id'] = this.borrowId;
    data['user_id'] = this.userId;
    data['room'] = this.room;
    data['Name'] = this.name;
    data['Fig'] = this.fig;
    data['duedate'] = this.duedate;
    data['status'] = this.status;
    return data;
  }
}
