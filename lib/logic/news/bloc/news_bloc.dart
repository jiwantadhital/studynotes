import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/news_controller.dart';
import 'package:studynotes/models/news_model.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
    NewsController newsController;

  NewsBloc({required this.newsController}) : super(NewsInitial()) {
    on<NewsEvent>((event, emit) async{
      emit(NewsLoading());
      try{
      var data = await newsController.getnews();
      emit(NewsGot(newsModel: data));
      }
      catch(e){
        emit(NewsError(message: e.toString()));
      }
    });
  }
}
