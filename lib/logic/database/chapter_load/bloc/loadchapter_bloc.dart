import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_controller.dart';
import 'package:studynotes/local_databases/sqlite/chapter_database_model.dart';

part 'loadchapter_event.dart';
part 'loadchapter_state.dart';

class LoadchapterBloc extends Bloc<LoadchapterEvent, LoadchapterState> {
  ChapterDatabaseController chapterDatabaseController;
  LoadchapterBloc({required this.chapterDatabaseController}) : super(LoadchapterInitial()) {
    on<LoadingAllChapterEvent>((event, emit) async{
              emit(LoadChapterLoading());
         try{
       var data= await chapterDatabaseController.getAllChapters();
        var allData = data.map((e) => e.c_id).toList();
        print(allData);
        emit(LoadChapterLoaded(chapterModelDatabase: data,allData: allData));
      }
      catch(e){
        emit(LoadChapterError(message: e.toString()));
      }
    });
  }
}
