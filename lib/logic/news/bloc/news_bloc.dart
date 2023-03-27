import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends HydratedBloc<NewsEvent, NewsState> {
    NewsController newsController;
    List<NewsModel> allModel=[];
  NewsBloc({required this.newsController}) : super(NewsInitial()) {
    on<NewsGetEvent>((event, emit) async{
      emit(NewsLoading());
      try{
      var data = await newsController.getnews();
      emit(NewsGot(newsModel: data));
      }
      catch(e){
        if(allModel.isEmpty){
        emit(NewsError(message: e.toString()));
        }
        else{
          emit(NewsGot(newsModel: allModel));
        }
      }
    });
  }
  
  @override
  NewsState? fromJson(Map<String, dynamic> json) {
       try {
      final newsModelList = (json['newsModel'] as List)
          .map((e) => NewsModel.fromJson(e))
          .toList();
          allModel = newsModelList;
      return NewsGot(newsModel: newsModelList);
    } catch (_) {
      return null;
    }
  }
  
  @override
  Map<String, dynamic>? toJson(NewsState state) {
   if(state is NewsGot){
      return {'newsModel': state.newsModel.map((e) => e.toJson()).toList()};
   }
   return null;
  }
   @override
  bool shouldRehydrate(NewsState previousState, NewsState newState) {
    return newState is NewsError;
  }
}
