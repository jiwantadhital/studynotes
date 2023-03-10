import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/chapter_model.dart';

part 'chapter_event.dart';
part 'chapter_state.dart';

class ChapterBloc extends Bloc<ChapterEvent, ChapterState> {
  NotesController notesController;
  ChapterBloc({required this.notesController}) : super(ChapterInitial()) {
    on<ChapterGettingEvent>((event, emit) async{
        emit(ChapterLoading());
      try{
      var data = await notesController.getChapters(event.id);
     var chapId= data.map((e) => e.id).toList();
      emit(ChapterGot(chapterModel: data,chapterId: chapId));
      }
      catch(e){
        emit(ChapterError(message: e.toString()));
      }
    });
  }
}
