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
    qyear = json['qyear'] != null ? Qyear.fromJson(json['qyear']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['sem_id'] = semId;
    data['sub_id'] = subId;
    data['year_id'] = yearId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (qyear != null) {
      data['qyear'] = qyear!.toJson();
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
