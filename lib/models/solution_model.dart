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
    qyear = json['qyear'] != null ? new Qyear.fromJson(json['qyear']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['sem_id'] = this.semId;
    data['sub_id'] = this.subId;
    data['questionyear_id'] = this.questionyearId;
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
