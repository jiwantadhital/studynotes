part of 'news_bloc.dart';

abstract class NewsState extends Equatable {
  const NewsState();
  
  @override
  List<Object> get props => [];
}

class NewsInitial extends NewsState {}
class NewsLoading extends NewsState{}

class NewsGot extends NewsState {
  List<NewsModel> newsModel;
  NewsGot({
    required this.newsModel,
  });
   @override
  List<Object> get props => [NewsModel];
}

class NewsError extends NewsState {
  String message;
  NewsError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}