import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/semester_model.dart';

part 'semesters_event.dart';
part 'semesters_state.dart';

class SemestersBloc extends Bloc<SemestersEvent, SemestersState> {
  NotesController notesController;
  SemestersBloc({required this.notesController}) : super(SemestersInitial()) {
    on<SemesterGettingEvent>((event, emit)async{
         emit(SemesterLoading());
      try{
      var data = await notesController.getSemester();
      emit(SemesterGot(semesterModel: data));
      }
      catch(e){
        emit(SemesterError(message: e.toString()));
      }
    });
  }
}
