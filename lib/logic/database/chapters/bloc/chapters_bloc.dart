import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

part 'chapters_event.dart';
part 'chapters_state.dart';

class ChaptersBloc extends Bloc<ChaptersEvent, ChaptersState> {
  ChapterDatabaseController chapterDatabaseController;
  ChaptersBloc({required this.chapterDatabaseController}) : super(ChaptersInitial()) {
    //read
    on<ChaptersGettingEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.getChapter();
        emit(ChaptersLoaded(chapterModelDatabase: chapterDatabaseController.chapter));
      }
      catch(e){
        emit(ChaptersError(message: "Something Went Wrong"));
      }
    });
    //add
    on<ChaptersCreatingEvent>((event, emit) async{
      try{
        emit(ChaptersLoading());
        await chapterDatabaseController.addChapterData(event.semester,event.subject,event.chapterId,event.chapterNumber,event.chapterName,event.chapterDesc);
        emit(ChaptersAdded());
      }
      catch(e){
        emit(ChaptersError(message: "Something Went Wrong"));
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
