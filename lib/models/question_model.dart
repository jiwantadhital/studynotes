class QuestionModel {
  int? id;
  String? image;
  int? semId;
  int? subId;
  int? yearId;
  String? createdAt;
  String? updatedAt;
  Qyear? qyear;

  QuestionModel(
      {this.id,
      this.image,
      this.semId,
      this.subId,
      this.yearId,
      this.createdAt,
      this.updatedAt,
      this.qyear});

  QuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    yearId = json['year_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    qyear = json['qyear'] != null ? new Qyear.fromJson(json['qyear']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['sem_id'] = this.semId;
    data['sub_id'] = this.subId;
    data['year_id'] = this.yearId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.qyear != null) {
      data['qyear'] = this.qyear!.toJson();
    }
    return data;
  }
}

class Qyear {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;

  Qyear({this.id, this.name, this.createdAt, this.updatedAt});

  Qyear.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
