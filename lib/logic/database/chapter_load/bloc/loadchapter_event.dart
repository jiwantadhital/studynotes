part of 'loadchapter_bloc.dart';

abstract class LoadchapterEvent extends Equatable {
  const LoadchapterEvent();

  @override
  List<Object> get props => [];
}

class LoadingAllChapterEvent extends LoadchapterEvent{}