// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'loadchapter_bloc.dart';

abstract class LoadchapterState extends Equatable {
  const LoadchapterState();
  
  @override
  List<Object> get props => [];
}

class LoadchapterInitial extends LoadchapterState {}
class LoadChapterLoading extends LoadchapterState{}

class LoadChapterLoaded extends LoadchapterState {
  List allData;
  List<ChapterModelDatabase> chapterModelDatabase;
  LoadChapterLoaded({
    required this.allData,
    required this.chapterModelDatabase,
  });
    @override
  List<Object> get props => [chapterModelDatabase];
}


class LoadChapterError extends LoadchapterState {
  String message;
  LoadChapterError({
    required this.message,
  });
}
