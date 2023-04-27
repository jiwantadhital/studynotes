
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
   int page =1;
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  int finalNo = 0;
    NewsController newsController;
  NewsBloc({required this.newsController}) : super(NewsInitial()) {
     scrollController.addListener(() {
      print("al");
     add(NewsFetchingEvent()); 
    },);
    on<NewsGetEvent>((event, emit) async{
      emit(NewsLoading());
      try{
      var data = await newsController.getnews(page);
      emit(NewsGot(newsModel: data));
      }
      catch(e){
        emit(NewsError(message: e.toString()));
      
      }
    });
      on<NewsFetchingEvent>((event, emit) async{
      if(scrollController.position.pixels == scrollController.position.maxScrollExtent){
        isLoadingMore = true;
        page++;
        var data = await newsController.getnews(page);
        finalNo = finalNo+data.length;
        var no = newsController.pageNo;
        if(finalNo==no){
          isLoadingMore=false;
        }
        else{
         isLoadingMore = true;
        }
        emit(NewsGot(newsModel: [...state.newsModel, ...data]));
      }
    },
      );
  }

}
