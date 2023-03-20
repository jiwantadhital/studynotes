import 'dart:convert';

import 'package:studynotes/models/institute_model.dart';
import 'package:studynotes/repositories/auth_repo.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class InstituteController{
   List<InstituteModel>  instituteModel = [];
  GetRepo getRepo = GetRepo();
  AuthRepo authRepo = AuthRepo();

  Future<List<InstituteModel>> getInstitute() async{
    var response = await getRepo.getRepo("${ApiClass.instituteApi}");
    List data = jsonDecode(response.body);
   instituteModel = data.map((e) => InstituteModel.fromJson(e)).toList();
    return data.map(((e)=> InstituteModel.fromJson(e))).toList();  
  }

  //images
     List<ImagesModel>  imageModel = [];

  Future<List<ImagesModel>> getImage(id) async{
    var response = await getRepo.getRepo("${ApiClass.imageApi}/$id");
    List data = jsonDecode(response.body);
   imageModel = data.map((e) => ImagesModel.fromJson(e)).toList();
    return data.map(((e)=> ImagesModel.fromJson(e))).toList();  
  }

  //images
     List<CommentModel>  commentModel = [];

  Future<List<CommentModel>> getComment(id) async{
    var response = await getRepo.getRepo("${ApiClass.commentApi}/$id");
    List data = jsonDecode(response.body);
   commentModel = data.map((e) => CommentModel.fromJson(e)).toList();
    return data.map(((e)=> CommentModel.fromJson(e))).toList();  
  }

  //post
var postModel;

  Future<PostModel> postComment(rate,desc,id,studentId,collegeId)async{

var response = await authRepo.postRepo("${ApiClass.postApi}", rate,desc,id,studentId,collegeId);

    var data = jsonDecode(response.body);
    postModel = PostModel.fromJson(data);
    print(response.body);
    return postModel;
}
}