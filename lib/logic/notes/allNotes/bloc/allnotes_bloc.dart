import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/all_notes_model.dart';

part 'allnotes_event.dart';
part 'allnotes_state.dart';

class AllnotesBloc extends HydratedBloc<AllnotesEvent, AllnotesState> {
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
  
  @override
  AllnotesState? fromJson(Map<String, dynamic> json) {
    try{
      final data = AllNotesModel.fromJson(json);
      return AllnotesGot(allNotesModel: data);
    }
    catch(e){
      return null;
    }
  }
  
  @override
  Map<String, dynamic>? toJson(AllnotesState state) {
    if(state is AllnotesGot){
      return state.allNotesModel.toJson();
    }
    else{
      return null;
    }
  }
}
