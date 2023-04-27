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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['logo'] = logo;
    data['description'] = description;
    data['details'] = details;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['college_id'] = collegeId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
        json['student'] != null ? Student.fromJson(json['student']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['comments_ratting'] = commentsRatting;
    data['description'] = description;
    data['user_id'] = userId;
    data['student_id'] = studentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['college_id'] = collegeId;
    if (student != null) {
      data['student'] = student!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['user_id'] = userId;
    data['phone'] = phone;
    data['college_id'] = collegeId;
    data['sem_id'] = semId;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['messgae'] = messgae;
    return data;
  }
}
