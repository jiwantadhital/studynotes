class AllNotesModel {
  int? id;
  String? notes;
  int? semId;
  int? subId;
  int? chapterId;
  String? createdAt;
  String? updatedAt;
  Chapter? chapter;

  AllNotesModel(
      {this.id,
      this.notes,
      this.semId,
      this.subId,
      this.chapterId,
      this.createdAt,
      this.updatedAt,
      this.chapter});

  AllNotesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    notes = json['notes'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    chapterId = json['chapter_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    chapter =
        json['chapter'] != null ? new Chapter.fromJson(json['chapter']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['notes'] = this.notes;
    data['sem_id'] = this.semId;
    data['sub_id'] = this.subId;
    data['chapter_id'] = this.chapterId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.chapter != null) {
      data['chapter'] = this.chapter!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['number'] = this.number;
    data['sem_id'] = this.semId;
    data['sub_id'] = this.subId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
