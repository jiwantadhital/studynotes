import 'dart:convert';

import 'package:studynotes/models/news_model.dart';
import 'package:studynotes/repositories/get_repo.dart';
import 'package:studynotes/resources/constants.dart';

class NewsController{
  List<NewsModel>  newsModel = [];
  GetRepo getRepo = GetRepo();

  Future<List<NewsModel>> getnews() async{
    var response = await getRepo.getRepo("${ApiClass.newsApi}");
    List data = jsonDecode(response.body);
   newsModel = data.map((e) => NewsModel.fromJson(e)).toList();
    return data.map(((e)=> NewsModel.fromJson(e))).toList();  
  }
}