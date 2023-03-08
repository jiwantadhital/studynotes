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
