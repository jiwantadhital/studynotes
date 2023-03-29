import 'dart:convert';

import 'package:studynotes/models/news_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NewsController{
  List<NewsModel>  newsModel = [];
    int pageNo = 0;
  int total = 0;
  GetRepo getRepo = GetRepo();

  Future<List<NewsModel>> getnews(page) async{
    var response = await getRepo.getRepo("${ApiClass.newsApi}?page=$page");
    List data = jsonDecode(response.body)['data'];
     pageNo = jsonDecode(response.body)['total']-jsonDecode(response.body)['per_page'];
    total = jsonDecode(response.body)["total"];
   newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return data.map(((e)=> NewsModel.fromJson(e))).toList();  
  }
}