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



//edit profile

class EditProfileModel {
  bool? success;

  EditProfileModel({this.success});

  EditProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}


//get profile
class ProfileModel {
  int? id;
  String? name;
  int? otp;
  int? userId;
  int? phone;
  Null? collegeId;
  int? semId;
  String? image;
  String? createdAt;
  String? updatedAt;
  User? user;
  Semester? semester;

  ProfileModel(
      {this.id,
      this.name,
      this.otp,
      this.userId,
      this.phone,
      this.collegeId,
      this.semId,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.user,
      this.semester});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    otp = json['otp'];
    userId = json['user_id'];
    phone = json['phone'];
    collegeId = json['college_id'];
    semId = json['sem_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    semester = json['semester'] != null
        ? new Semester.fromJson(json['semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['otp'] = this.otp;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['college_id'] = this.collegeId;
    data['sem_id'] = this.semId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  int? phoneVerified;
  Null? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phoneVerified,
      this.emailVerifiedAt,
      this.createdAt,
      this.updatedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneVerified = json['phone_verified'];
    emailVerifiedAt = json['email_verified_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_verified'] = this.phoneVerified;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Semester {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Semester({this.id, this.name, this.createdAt, this.updatedAt});

  Semester.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
