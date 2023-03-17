class GoogleModel {
  String? token;
  String? message;
  bool? time;
  int? userId;
  String? userName;
  int? phoneVerified;
  String? userEmail;

  GoogleModel(
      {this.token,
      this.message,
      this.time,
      this.userId,
      this.userName,
      this.phoneVerified,
      this.userEmail});

  GoogleModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    message = json['message'];
    time = json['time'];
    userId = json['user_id'];
    userName = json['user_name'];
    phoneVerified = json['phone_verified'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['message'] = this.message;
    data['time'] = this.time;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['phone_verified'] = this.phoneVerified;
    data['user_email'] = this.userEmail;
    return data;
  }
}
