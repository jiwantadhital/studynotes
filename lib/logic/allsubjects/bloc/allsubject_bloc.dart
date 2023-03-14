import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/all_subjects_model.dart';

part 'allsubject_event.dart';
part 'allsubject_state.dart';

class AllsubjectBloc extends Bloc<AllsubjectEvent, AllsubjectState> {
  NotesController notesController;
  AllsubjectBloc({required this.notesController}) : super(AllsubjectInitial()) {
    on<AllSubjectGettingEvent>((event, emit) async{
      emit(AllsubjectLoading());
      try{
        var data = await notesController.getAllSubject();
        emit(AllsubjectGot(allSubjectModel: data));
      }
      catch(e){
        emit(AllsubjectError(message: "Something went wrong"));
      }
    });
  }
}
