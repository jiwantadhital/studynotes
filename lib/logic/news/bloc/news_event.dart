part of 'news_bloc.dart';

abstract class NewsEvent extends Equatable {}

class NewsGetEvent extends NewsEvent{

  @override
  List<Object> get props => [];
}