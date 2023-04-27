class NewsModel {
  int? id;
  String? title;
  String? image;
  String? description;
  String? createdAt;
  String? updatedAt;

  NewsModel(
      {this.id,
      this.title,
      this.image,
      this.description,
      this.createdAt,
      this.updatedAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
