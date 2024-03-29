part of 'chapters_bloc.dart';

abstract class ChaptersState extends Equatable {
  const ChaptersState();
  
  @override
  List<Object> get props => [];
}

class ChaptersInitial extends ChaptersState {}

class ChaptersLoading extends ChaptersState{}
class ChaptersLoaded extends ChaptersState {
  final List<ChapterDModel> chapterModelDatabase;
  const ChaptersLoaded({
    required this.chapterModelDatabase,
  });
}

class AllChaptersLoading extends ChaptersState{}
class AllChaptersLoaded extends ChaptersState {
  final List<ChapterModelDatabase> chapterModelDatabase;
  const AllChaptersLoaded({
    required this.chapterModelDatabase,
  });
}
class SubjectChapterLoaded extends ChaptersState {
  final List<SubjectDatabaseModel> subjectModelDatabase;
  const SubjectChapterLoaded({
    required this.subjectModelDatabase,
  });
}
class ChaptersLoadedClass extends ChaptersState {
  final List<ChapterModelDatabase> chapterModelDatabase;
  const ChaptersLoadedClass({
    required this.chapterModelDatabase,
  });
}
class ChaptersAdded extends ChaptersState{}
class ChaptersUpdated extends ChaptersState{}
class ChaptersDeleted extends ChaptersState{}
class ChaptersError extends ChaptersState {
  String message;
  ChaptersError({
    required this.message,
  });
}