class AllSubjectModel {
  int? id;
  String? title;
  int? semId;
  String? createdAt;
  String? updatedAt;
  Semester? semester;

  AllSubjectModel(
      {this.id,
      this.title,
      this.semId,
      this.createdAt,
      this.updatedAt,
      this.semester});

  AllSubjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    semId = json['sem_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    semester = json['semester'] != null
        ? new Semester.fromJson(json['semester'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['sem_id'] = this.semId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.semester != null) {
      data['semester'] = this.semester!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
