class SolutionModel {
  int? id;
  String? image;
  int? semId;
  int? subId;
  int? questionyearId;
  String? createdAt;
  String? updatedAt;
  Qyear? qyear;

  SolutionModel(
      {this.id,
      this.image,
      this.semId,
      this.subId,
      this.questionyearId,
      this.createdAt,
      this.updatedAt,
      this.qyear});

  SolutionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    semId = json['sem_id'];
    subId = json['sub_id'];
    questionyearId = json['questionyear_id'];
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
    data['questionyear_id'] = questionyearId;
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
