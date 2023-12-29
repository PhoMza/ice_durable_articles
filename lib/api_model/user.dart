class User {
  String? user_id;
  String? name;
  String? email;
  String? password;
  // String? createdAt;
  // String? updatedAt;
  String? role;

  User({this.user_id , this.name, this.email, this.password, this.role,});

  

  User.fromJson(Map<String, dynamic> json) {
    user_id = json['user_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    // createdAt = json['created_at'];
    // updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.user_id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }

  static query(String query, {required List<int> arguments}) {}
}
