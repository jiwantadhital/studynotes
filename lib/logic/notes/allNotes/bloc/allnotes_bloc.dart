import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/all_notes_model.dart';

part 'allnotes_event.dart';
part 'allnotes_state.dart';

class AllnotesBloc extends Bloc<AllnotesEvent, AllnotesState> {
  NotesController notesController;
  AllnotesBloc({required this.notesController}) : super(AllnotesInitial()) {
    on<AllnotesGettingEvent>((event, emit) async{
        emit(AllnotesLoading());
      try{
      var data = await notesController.getNotes(event.id);
      emit(AllnotesGot(allNotesModel: data));
      }
      catch(e){
        print(e);
        emit(AllnotesError(message: e.toString()));
      }

    });
  }
}
