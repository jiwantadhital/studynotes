part of 'chapter_bloc.dart';

abstract class ChapterState extends Equatable {
  const ChapterState();
  
  @override
  List<Object> get props => [];
}

class ChapterInitial extends ChapterState {}

class ChapterLoading extends ChapterState{}

class ChapterGot extends ChapterState {
  List chapterId;
  List<ChapterModel> chapterModel;
  ChapterGot({
    required this.chapterId,
    required this.chapterModel,
  });
   @override
  List<Object> get props => [chapterModel];
}


class ChapterError extends ChapterState {
  String message;
  ChapterError({
    required this.message,
  });
   @override
  List<Object> get props => [message];
}