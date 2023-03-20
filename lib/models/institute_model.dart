class InstituteModel {
  int? id;
  String? name;
  String? logo;
  String? description;
  String? details;
  String? createdAt;
  String? updatedAt;

  InstituteModel(
      {this.id,
      this.name,
      this.logo,
      this.description,
      this.details,
      this.createdAt,
      this.updatedAt});

  InstituteModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    logo = json['logo'];
    description = json['description'];
    details = json['details'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['description'] = this.description;
    data['details'] = this.details;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class ImagesModel {
  int? id;
  String? image;
  int? collegeId;
  String? createdAt;
  String? updatedAt;

  ImagesModel(
      {this.id, this.image, this.collegeId, this.createdAt, this.updatedAt});

  ImagesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    collegeId = json['college_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['college_id'] = this.collegeId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}


class CommentModel {
  int? id;
  int? commentsRatting;
  String? description;
  int? userId;
  int? studentId;
  String? createdAt;
  String? updatedAt;
  int? collegeId;
  Student? student;

  CommentModel(
      {this.id,
      this.commentsRatting,
      this.description,
      this.userId,
      this.studentId,
      this.createdAt,
      this.updatedAt,
      this.collegeId,
      this.student});

  CommentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentsRatting = json['comments_ratting'];
    description = json['description'];
    userId = json['user_id'];
    studentId = json['student_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    collegeId = json['college_id'];
    student =
        json['student'] != null ? new Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comments_ratting'] = this.commentsRatting;
    data['description'] = this.description;
    data['user_id'] = this.userId;
    data['student_id'] = this.studentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['college_id'] = this.collegeId;
    if (this.student != null) {
      data['student'] = this.student!.toJson();
    }
    return data;
  }
}

class Student {
  int? id;
  String? name;
  int? userId;
  int? phone;
  int? collegeId;
  int? semId;
  String? image;
  String? createdAt;
  String? updatedAt;

  Student(
      {this.id,
      this.name,
      this.userId,
      this.phone,
      this.collegeId,
      this.semId,
      this.image,
      this.createdAt,
      this.updatedAt});

  Student.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userId = json['user_id'];
    phone = json['phone'];
    collegeId = json['college_id'];
    semId = json['sem_id'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['user_id'] = this.userId;
    data['phone'] = this.phone;
    data['college_id'] = this.collegeId;
    data['sem_id'] = this.semId;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class PostModel {
  bool? messgae;

  PostModel({this.messgae});

  PostModel.fromJson(Map<String, dynamic> json) {
    messgae = json['messgae'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['messgae'] = this.messgae;
    return data;
  }
}
