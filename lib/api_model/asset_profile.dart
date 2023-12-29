class AssetProfile {
  String? userId;
  String? username;
  String? email;
  String? password;
  String? role;

  AssetProfile(
      {this.userId, this.username, this.email, this.password, this.role});

  AssetProfile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    return data;
  }
}
