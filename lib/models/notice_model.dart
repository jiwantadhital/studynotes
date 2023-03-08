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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
