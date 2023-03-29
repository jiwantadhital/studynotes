// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'chapters_bloc.dart';

abstract class ChaptersEvent extends Equatable {
  const ChaptersEvent();

  @override
  List<Object> get props => [];
}
class ChaptersCreatingEvent extends ChaptersEvent {
  String semester;
  int subjectId;
  String subject;
  int chapterId;
  String chapterName;
  String chapterNumber;
  String chapterDesc;
  String pdf;
  ChaptersCreatingEvent({
    required this.semester,
    required this.subjectId,
    required this.subject,
    required this.chapterId,
    required this.chapterName,
    required this.chapterNumber,
    required this.chapterDesc,
    required this.pdf,
  });
  @override
  List<Object> get props => [semester,subjectId,subject,chapterId,chapterName,chapterNumber,chapterDesc,pdf];
}

class ChaptersGettingEvent extends ChaptersEvent {
  int id;
  ChaptersGettingEvent({
    required this.id,
  });
}

class ChaptersSubjectEvent extends ChaptersEvent{}

class AllChaptersEvent extends ChaptersEvent{}
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
