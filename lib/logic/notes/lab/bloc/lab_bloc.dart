import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/lab_model.dart';

part 'lab_event.dart';
part 'lab_state.dart';

class LabBloc extends Bloc<LabEvent, LabState> {
  NotesController notesController;
  LabBloc({required this.notesController}) : super(LabInitial()) {
    on<LabGettingEvent>((event, emit)async {
      emit(LabLoading());
      try{
        var data = await notesController.getLabs(event.id);
        emit(LabGot(labModel: data));
      }
      catch(e){
        emit(LabError(message: "Something went wrong"));
      }
    });
  }
}
