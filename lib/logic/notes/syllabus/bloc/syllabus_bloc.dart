import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/syllabus_model.dart';

part 'syllabus_event.dart';
part 'syllabus_state.dart';

class SyllabusBloc extends Bloc<SyllabusEvent, SyllabusState> {
  NotesController notesController;
  SyllabusBloc({required this.notesController}) : super(SyllabusInitial()) {
    on<SyllabusGettingEvent>((event, emit) async{
        emit(SyllabusLoading());
      try{
      var data = await notesController.getSyllabus(event.id);
      emit(SyllabusGot(syllabusModel: data));
      }
      catch(e){
        emit(SyllabusError(message: e.toString()));
      }
    });
  }
}
