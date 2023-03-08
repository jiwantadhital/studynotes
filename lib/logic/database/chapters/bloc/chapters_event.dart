// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chapters_bloc.dart';

abstract class ChaptersEvent extends Equatable {
  const ChaptersEvent();

  @override
  List<Object> get props => [];
}
class ChaptersCreatingEvent extends ChaptersEvent {
  String semester;
  String subject;
  int chapterId;
  String chapterName;
  String chapterNumber;
  String chapterDesc;
  ChaptersCreatingEvent({
    required this.semester,
    required this.subject,
    required this.chapterId,
    required this.chapterName,
    required this.chapterNumber,
    required this.chapterDesc,
  });
  @override
  List<Object> get props => [semester,subject,chapterId,chapterName,chapterNumber,chapterDesc];
}

class ChaptersGettingEvent extends ChaptersEvent{}
class ChaptersUpdatingEvent extends ChaptersEvent {
  int id;
  ChaptersUpdatingEvent({
    required this.id,
  });
}
class ChaptersDeletingEvent extends ChaptersEvent {
  int id;
  ChaptersDeletingEvent({
    required this.id,
  });
}
