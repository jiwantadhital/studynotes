class NewsModel {
  int? id;
  String? title;
  String? image;
  String? desc;
  String? createdAt;

  NewsModel({this.id, this.title, this.image, this.desc, this.createdAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    desc = json['desc'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['desc'] = this.desc;
    data['created_at'] = this.createdAt;
    return data;
  }
}
