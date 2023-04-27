class SubjectModel {
  int? id;
  String? title;
  int? semId;
  String? createdAt;
  String? updatedAt;
  Semester? semester;

  SubjectModel(
      {this.id,
      this.title,
      this.semId,
      this.createdAt,
      this.updatedAt,
      this.semester});

  SubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    semId = json['sem_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    semester = json['semester'] != null
        ? Semester.fromJson(json['semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['sem_id'] = semId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

