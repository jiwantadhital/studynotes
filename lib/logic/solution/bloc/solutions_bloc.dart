import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/solution_model.dart';

part 'solutions_event.dart';
part 'solutions_state.dart';

class SolutionsBloc extends Bloc<SolutionsEvent, SolutionsState> {
  NotesController notesController;
  SolutionsBloc({required this.notesController}) : super(SolutionsInitial()) {
    on<SolutionGettingEvent>((event, emit) async{
      emit(SolutionsLoading());
      try{
        var data =await notesController.getSolutions(event.id,event.year_id);
        emit(SolutionsGot(solutionModel: data));
      }
      catch(e){
        emit(SolutionsError(message: "Something went wrong"));
      }
    });
  }
}
