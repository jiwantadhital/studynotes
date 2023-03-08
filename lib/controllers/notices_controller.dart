import 'dart:convert';

import 'package:studynotes/models/notice_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NoticeController{
  List<NoticeModel>  noticeModel = [];
  GetRepo getRepo = GetRepo();

  Future<List<NoticeModel>> getNotice() async{
    var response = await getRepo.getRepository("${ApiClass.noticeApi}");
    List data = jsonDecode(response.body);
   noticeModel = data.map((e) => NoticeModel.fromJson(e)).toList();
    return data.map(((e)=> NoticeModel.fromJson(e))).toList();  
  }
}