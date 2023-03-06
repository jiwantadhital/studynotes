class LoginModel {
  int? otp;
  String? token;
  String? message;
  int? userId;
  String? userName;
  int? phoneVerified;
  String? userEmail;

  LoginModel(
      {this.otp,
      this.token,
      this.message,
      this.userId,
      this.userName,
      this.phoneVerified,
      this.userEmail});

  LoginModel.fromJson(Map<String, dynamic> json) {
    otp = json['otp'];
    token = json['token'];
    message = json['message'];
    userId = json['user_id'];
    userName = json['user_name'];
    phoneVerified = json['phone_verified'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['otp'] = this.otp;
    data['token'] = this.token;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['user_name'] = this.userName;
    data['phone_verified'] = this.phoneVerified;
    data['user_email'] = this.userEmail;
    return data;
  }
}





//register
class RegisterModel {
  String? token;
  int? otp;
  String? student;
  String? message;
  int? userId;
  int? phoneVerified;
  String? userEmail;

  RegisterModel(
      {this.token,
      this.otp,
      this.student,
      this.message,
      this.userId,
      this.phoneVerified,
      this.userEmail});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    otp = json['otp'];
    student = json['student'];
    message = json['message'];
    userId = json['user_id'];
    phoneVerified = json['phone_verified'];
    userEmail = json['user_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['otp'] = this.otp;
    data['student'] = this.student;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['phone_verified'] = this.phoneVerified;
    data['user_email'] = this.userEmail;
    return data;
  }
}


//otp
class OtpModel {
  String? message;

  OtpModel({this.message});

  OtpModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    return data;
  }
}
