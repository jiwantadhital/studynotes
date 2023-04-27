class LabModel {
  int? id;
  String? image;
  int? semId;
  int? subId;
  String? createdAt;
  String? updatedAt;
  Semester? semester;
  Subject? subject;

  LabModel(
      {this.id,
      this.image,
      this.semId,
      this.subId,
      this.createdAt,
      this.updatedAt,
      this.semester,
      this.subject});

  LabModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    semester = json['semester'] != null
        ? Semester.fromJson(json['semester'])
        : null;
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['sem_id'] = semId;
    data['sub_id'] = subId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    if (subject != null) {
      data['subject'] = subject!.toJson();
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

class Subject {
  int? id;
  String? title;
  int? semId;
  String? createdAt;
  String? updatedAt;

  Subject({this.id, this.title, this.semId, this.createdAt, this.updatedAt});

  Subject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    semId = json['sem_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['sem_id'] = semId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
