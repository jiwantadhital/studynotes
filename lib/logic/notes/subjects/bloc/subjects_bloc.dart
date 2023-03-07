import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/subject_model.dart';

part 'subjects_event.dart';
part 'subjects_state.dart';

class SubjectsBloc extends Bloc<SubjectsEvent, SubjectsState> {
  NotesController notesController;
  SubjectsBloc({required this.notesController}) : super(SubjectsInitial()) {
    on<SubjectGettingEvent>((event, emit) async{
       emit(SubjectLoading());
      try{
      var data = await notesController.getSubject(event.id);
      emit(SubjectGot(subjectModel: data));
      }
      catch(e){
        emit(SubjectError(message: e.toString()));
      }
    });
  }
}
