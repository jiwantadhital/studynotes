import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';
import 'package:studynotes/logic/notes/chapters/bloc/chapter_bloc.dart';

part 'chapters_event.dart';
part 'chapters_state.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {
  ChapterDatabaseController chapterDatabaseController;
  ChaptersBloc({required this.chapterDatabaseController}) : super(ChaptersInitial()) {
    //read
    on<ChaptersGettingEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.getChapter(event.id);
        emit(ChaptersLoaded(chapterModelDatabase: chapterDatabaseController.chapter));
      }
      catch(e){
        emit(ChaptersError(message: "Something Went Wrong"));
      }
    });
     //readSubject
    on<ChaptersSubjectEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.getSubject();
        emit(SubjectChapterLoaded(subjectModelDatabase: chapterDatabaseController.subject));
      }
      catch(e){
        emit(ChaptersError(message: e.toString()));
      }
    });
    //add
    on<ChaptersCreatingEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.addChapterData(event.semester,event.subjectId,event.subject,event.chapterId,event.chapterName,event.chapterNumber,event.chapterDesc,event.pdf);
        emit(ChaptersAdded());
      }
      catch(e){
        emit(ChaptersError(message: "Something Went Wrong"));
      }
    });
    //realallchapters
 on<AllChaptersEvent>((event, emit) async{
      try{
        emit(AllChaptersLoading());
        await chapterDatabaseController.getAllChapters();
        emit(AllChaptersLoaded(chapterModelDatabase: chapterDatabaseController.allChapters));
      }
      catch(e){
        emit(ChaptersError(message: e.toString()));
      }
    });
    //update

    //delete
     on<ChaptersDeletingEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.delete(event.id);
        emit(ChaptersDeleted());
      }
      catch(e){
        emit(ChaptersError(message: "Something Went Wrong"));
      }
    });
  }
}
