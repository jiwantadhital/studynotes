import 'dart:convert';

import 'package:studynotes/models/notice_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NoticeController{
  List<NoticeModel>  noticeModel = [];
  int pageNo = 0;
  int total = 0;
  GetRepo getRepo = GetRepo();

  Future<List<NoticeModel>> getNotice(page) async{
    var response = await getRepo.getRepository("${ApiClass.noticeApi}?page=$page");
    List data = jsonDecode(response.body)['data'];
    pageNo = jsonDecode(response.body)['total']-jsonDecode(response.body)['per_page'];
    total = jsonDecode(response.body)["total"];
   noticeModel = data.map((e) => NoticeModel.fromJson(e)).toList();
    return data.map(((e)=> NoticeModel.fromJson(e))).toList();  
  }

  //today notices
   List<NoticeModel>  todayModel = [];

  Future<List<NoticeModel>> getToday() async{
    var response = await getRepo.getRepository("${ApiClass.todaynoticeApi}");
    List data = jsonDecode(response.body);
   todayModel = data.map((e) => NoticeModel.fromJson(e)).toList();
    return data.map(((e)=> NoticeModel.fromJson(e))).toList();  
  }

  //this Week
  //today notices
   List<NoticeModel>  thisWeekModel = [];

  Future<List<NoticeModel>> getWeek() async{
    var response = await getRepo.getRepository("${ApiClass.thisWeekeApi}");
    List data = jsonDecode(response.body);
   thisWeekModel = data.map((e) => NoticeModel.fromJson(e)).toList();
    return data.map(((e)=> NoticeModel.fromJson(e))).toList();  
  }
}