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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['message'] = message;
    data['time'] = time;
    data['user_id'] = userId;
    data['user_name'] = userName;
    data['phone_verified'] = phoneVerified;
    data['user_email'] = userEmail;
    return data;
  }
}
