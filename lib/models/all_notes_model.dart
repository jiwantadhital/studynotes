class AllNotesModel {
  int? id;
  String? notes;
  String? image;
  int? semId;
  int? subId;
  int? chapterId;
  String? createdAt;
  String? updatedAt;
  Chapter? chapter;
  Semester? semester;
  Subject? subject;

  AllNotesModel(
      {this.id,
      this.notes,
      this.image,
      this.semId,
      this.subId,
      this.chapterId,
      this.createdAt,
      this.updatedAt,
      this.chapter,
      this.semester,
      this.subject});

  AllNotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notes = json['notes'];
    image = json['image'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    chapterId = json['chapter_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    chapter =
        json['chapter'] != null ? Chapter.fromJson(json['chapter']) : null;
    semester = json['semester'] != null
        ? Semester.fromJson(json['semester'])
        : null;
    subject =
        json['subject'] != null ? Subject.fromJson(json['subject']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['notes'] = notes;
    data['image'] = image;
    data['sem_id'] = semId;
    data['sub_id'] = subId;
    data['chapter_id'] = chapterId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (chapter != null) {
      data['chapter'] = chapter!.toJson();
    }
    if (semester != null) {
      data['semester'] = semester!.toJson();
    }
    if (subject != null) {
      data['subject'] = subject!.toJson();
    }
    return data;
  }
}

class Chapter {
  int? id;
  String? name;
  int? number;
  int? semId;
  int? subId;
  String? createdAt;
  String? updatedAt;

  Chapter(
      {this.id,
      this.name,
      this.number,
      this.semId,
      this.subId,
      this.createdAt,
      this.updatedAt});

  Chapter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    number = json['number'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['number'] = number;
    data['sem_id'] = semId;
    data['sub_id'] = subId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
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
