class ChapterModel {
  int? id;
  String? name;
  int? number;
  int? semId;
  int? subId;
  String? createdAt;
  String? updatedAt;

  ChapterModel(
      {this.id,
      this.name,
      this.number,
      this.semId,
      this.subId,
      this.createdAt,
      this.updatedAt});

  ChapterModel.fromJson(Map<String, dynamic> json) {
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
