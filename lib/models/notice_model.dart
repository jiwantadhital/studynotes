class NoticeModel {
  int? id;
  String? title;
  String? shortDescription;
  String? description;
  String? createdAt;
  String? updatedAt;

  NoticeModel(
      {this.id,
      this.title,
      this.shortDescription,
      this.description,
      this.createdAt,
      this.updatedAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDescription = json['short_description'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['short_description'] = shortDescription;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
