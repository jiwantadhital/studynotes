import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/question_model.dart';

part 'question_event.dart';
part 'question_state.dart';

class QuestionBloc extends Bloc<QuestionEvent, QuestionState> {
  NotesController notesController;
  QuestionBloc({required this.notesController}) : super(QuestionInitial()) {
    on<QuestionGettingEvent>((event, emit) async{
         emit(QuestionLoading());
      try{
      var data = await notesController.getQuestions(event.id, event.year_id);
      emit(QuestionGot(questionModel: data));
      }
      catch(e){
        emit(QuestionError(message: e.toString()));
      }
    });
  }
}
