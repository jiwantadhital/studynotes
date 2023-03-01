class NoticeModel {
  int? id;
  String? title;
  String? shortDesc;
  String? desc;
  String? createdAt;

  NoticeModel({this.id, this.title, this.shortDesc, this.desc, this.createdAt});

  NoticeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    shortDesc = json['short_desc'];
    desc = json['desc'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['short_desc'] = this.shortDesc;
    data['desc'] = this.desc;
    data['created_at'] = this.createdAt;
    return data;
  }
}
