import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:studynotes/controllers/notes_controller.dart';
import 'package:studynotes/models/qyear_model.dart';

part 'qyear_event.dart';
part 'qyear_state.dart';

class QyearBloc extends Bloc<QyearEvent, QyearState> {
  NotesController notesController;
  QyearBloc({required this.notesController}) : super(QyearInitial()) {
    on<QyearGettingEvent>((event, emit) async{
         emit(QyearLoading());
      try{
      var data = await notesController.getQyear();
      emit(QyearGot(qyearModel: data));
      }
      catch(e){
        emit(QyearError(message: e.toString()));
      }
    });
  }
}
